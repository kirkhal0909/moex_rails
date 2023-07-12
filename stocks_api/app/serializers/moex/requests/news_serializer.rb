module Moex
  module Requests
    class NewsSerializer < ApplicationSerializer
      attributes :id, :client, :client_id, :date, :message, :symbols, :likes, :url

      def client
        object.dig('client', 'name')
      end

      def client_id
        object.dig('client', 'clientId')
      end

      def symbols
        object['instruments']&.map { |ticker| ticker['securityCode'] }
      end

      def likes
        object.dig('likes', 'count')
      end

      def url
        object['sharingText']
      end
    end
  end
end
