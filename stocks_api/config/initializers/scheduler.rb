if defined?(Rails::Server)
  scheduler = Rufus::Scheduler.new
  now = Time.zone.now

  scheduler.every '24h', first_in: '1s' do
    Scheduler::PutsAndCall.new(Interactors::Moex::UpdateTickerList).call
  end

  scheduler.every '24h', first_in: '60s' do
    Scheduler::PutsAndCall.new(Moex::UpdateHistories).call
  end

  scheduler.every '15m', first_in: '60s' do
    Scheduler::PutsAndCall.new(Interactors::Messages::SendNews).call if Time.zone.now.hour >= 9
  end

  if now.hour < 10
    scheduler.at '1s' do
      Scheduler::PutsAndCall.new(Messages::TelegramSend).call
    end
  end

  scheduler.every '24h', first_at: '22:00' do
    Scheduler::PutsAndCall.new(Messages::TelegramSend).call
  end
end
