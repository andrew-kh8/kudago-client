module Kudago
  class Request
    def initialize(client)
      @client = client
    end

    def get(path, params = {})
      connection.get(path, params)
    end

    private

    def connection
      @connection ||= Kudago::Connection.new.connection
    end
  end
end
