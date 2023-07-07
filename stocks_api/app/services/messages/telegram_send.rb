module Messages
  class TelegramSend < ApplicationService
    def call
      Telegram::Bot::Client.run(token) do |bot|
        messages.each do |message|
          bot.api.send_message(chat_id: chat_id, text: message)
        end
      end
    end

    private

    def token
      ENV.fetch('TELEGRAM_API')
    end

    def chat_id
      ENV.fetch('ACOUNT_ID')
    end

    def messages
      Moex::Resume::Level::PrepareMessages.call
    end
  end
end
