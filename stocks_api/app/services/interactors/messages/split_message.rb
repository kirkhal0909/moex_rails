module Interactors
  module Messages
    class SplitMessage
      include Interactor

      before { context.messages ||= [''] }

      def call
        message.split("\n").each { |line| add(line) }
      end

      private

      def add(line)
        if size_valid?(line)
          messages[-1] += "#{line}\n"
        else
          line.length < max_size ? messages << line : context.messages += line.scan(/.{1,#{max_size - 1}}/)
        end
      end

      def size_valid?(line)
        (line + messages.last).length < max_size
      end

      def max_size
        context.max_size || 4096
      end

      def message
        context.message
      end

      def messages
        context.messages
      end
    end
  end
end
