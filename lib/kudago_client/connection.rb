require "faraday"
require "oj"

module KudagoClient
  class Connection
    BASE_URL = "https://kudago.com/public-api/v1.4/"

    def self.connection
      Faraday.new(options) do |faraday|
        faraday.request :url_encoded
        faraday.response :json, parser_options: {decoder: Oj, symbolize_names: true}
        faraday.adapter Faraday.default_adapter
      end
    end

    private_class_method

    def self.options
      {
        headers:,
        url: BASE_URL
      }
    end

    def self.headers
      {
        "Accept" => "application/json",
        "User-Agent" => "Kudago Client/#{KudagoClient::VERSION}"
      }
    end
  end
end
