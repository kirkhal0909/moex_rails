module Interactors
  module Moex
    class BaseInteractor
      include Interactor

      def client
        @client ||= ::Moex::Client.new
      end

      def rows(table_pos = 0)
        response.dig('document', 'data', table_pos, 'rows', 'row') ||
          response.dig('document', 'data', 'rows', 'row')
      end
    end
  end
end
