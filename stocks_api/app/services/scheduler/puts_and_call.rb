module Scheduler
  class PutsAndCall
    attr_reader :service

    def initialize(service)
      @service = service
    end

    def call
      puts " [SCHEDULER] #{service}.call"

      ActiveRecord::Base.logger.silence do
        service.call
      end
    end
  end
end
