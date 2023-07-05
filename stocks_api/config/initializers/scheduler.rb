if defined?(Rails::Server)
  scheduler = Rufus::Scheduler.new

  scheduler.every '24h', first_in: '1s' do
    Scheduler::PutsAndCall.new(
      Interactors::Moex::UpdateTickerList
    ).call
  end

  scheduler.every '24h', first_in: '60s' do
    Scheduler::PutsAndCall.new(
      Moex::UpdateHistories
    ).call
  end
end
