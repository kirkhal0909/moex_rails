if defined?(Rails::Server)
  def puts_and_call(service)
    puts " [SCHEDULER] #{serivce}.call"
    service.call
  end

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
