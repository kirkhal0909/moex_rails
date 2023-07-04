module Interactors
  module Moex
    class BaseInteractor
      include Interactor

      def client
        @client ||= ::Moex::Client.new
      end

      def rows(params = nil, table_pos = 0)
        data = params ? response(params) : response
        data_rows = data.dig('document', 'data', table_pos, 'rows', 'row') ||
                    data.dig('document', 'data', 'rows', 'row')
        data_rows.is_a?(Array) ? data_rows : [data_rows]
      end
    end
  end
end
