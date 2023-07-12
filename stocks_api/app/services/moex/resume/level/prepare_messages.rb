module Moex
  module Resume
    module Level
      class PrepareMessages < BaseResume
        def call
          full_message.split("\n").each_with_object(['']) do |line, messages|
            (line + messages.last).length < max_size ? messages[-1] += "#{line}\n" : messages << line
          end
        end

        private

        def max_size
          4096
        end

        def full_message
          message = []
          1.upto(3) do |list_level|
            filtered_rows = filter(resume(list_level))
            message << message_block(filtered_rows, list_level)
          end
          message.join("\n")
        end

        def resume(list_level)
          Calculate.new(Ticker.where(list_level: list_level)).call
        end

        def filter(resume, buy = true, count_more = 1)
          resume.select { |_symbol, values| values[:buy] == buy && values[:count] > count_more }
        end

        def message_block(resume, list_level)
          main_message = resume.each_with_object([]) do |(symbol, values), message_lines|
            message = "#{symbol} (#{values[:changed]}%) \n#{Ticker.find_by_symbol(symbol).name_full}\n"
            values.except(:buy, :changed).each { |key, value| message += " #{key} - #{value};" }
            message += "\n https://bcs-express.ru/kotirovki-i-grafiki/#{symbol}\n"
            message_lines << message
          end.join("\n")

          "list_level: #{list_level}\n\n#{main_message}\n\n------------------------------"
        end
      end
    end
  end
end
