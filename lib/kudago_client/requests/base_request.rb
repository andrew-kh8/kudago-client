require_relative "../connection"
require_relative "../error"

require "active_support/core_ext/hash"

module KudagoClient
  module Requests
    class BaseRequest
      def self.get(path, params = {})
        response = connection.get(path, params)

        if response.success?
          response.body
        else
          message = response.body.is_a?(String) ? [response.reason_phrase, response.status].join(" ") : response.body[:detail]
          raise KudagoClient::Error.new(message:, status: response.status, reason: response.reason_phrase)
        end
      end

      private_class_method

      def self.connection
        @@connection ||= Connection.connection
      end

      def self.parse_response_urls(res)
        res[:next_url] = res.delete :next
        res[:previous_url] = res.delete :previous

        res
      end
    end
  end
end
