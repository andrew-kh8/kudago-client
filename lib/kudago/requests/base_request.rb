require_relative "../connection"
require_relative "../error"

module Kudago
  module Requests
    class BaseRequest
      def self.get(path, params = {})
        response = connection.get(path, params)

        if response.success?
          response.body
        else
          raise Kudago::Error.new(message: response.body[:detail], status: response.status, reason: response.reason_phrase)
        end
      end

      private_class_method

      def self.connection
        @@connection ||= Connection.connection
      end
    end
  end
end
