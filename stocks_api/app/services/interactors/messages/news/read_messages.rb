module Interactors
  module Messages
    module News
      class ReadMessages
        include Interactor

        before { context.message = [] }

        def call
          stop if context.news.blank?
          prepare_message
          context.message = context.message.join("\n")
        end

        def prepare_message
          messages.each_with_index do |message, index|
            context.message << "#{clients[index]} (#{likes[index]}) - #{message.to_s.first(100)}\n-----------"
          end
        end

        def likes
          @likes ||= context.news.pluck(:likes)
        end

        def messages
          @messages ||= context.news.pluck(:message)
        end

        def clients
          @clients ||= context.news.pluck(:client)
        end

        def stop
          context.errors = { message: 'not actual news' }
          context.fail!
        end
      end
    end
  end
end
