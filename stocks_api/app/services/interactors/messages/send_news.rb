module Interactors
  module Messages
    class SendNews
      include Interactor::Organizer

      organize Moex::News::Update, Moex::News::Read, News::ReadMessages, News::ReadMessages, SplitMessage, Telegram::Send
    end
  end
end
