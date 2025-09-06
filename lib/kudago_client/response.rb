# frozen_string_literal: true

require "active_support/core_ext/hash"

module KudagoClient
  class Response
    attr_reader :list, :data

    def initialize(response_body)
      @list = true

      prepared_data =
        if response_body.is_a? Array
          data_with_count = parse_with_count(response_body)
          parse_response_urls(data_with_count)
        elsif response_body.is_a?(Hash) && response_body.key?(:count)
          parse_response_urls(response_body)
        else
          @list = false
          response_body
        end

      @data = prepared_data
    end

    def list?
      list
    end

    private

    def parse_response_urls(res)
      res[:next_url] = res.delete :next
      res[:previous_url] = res.delete :previous

      res
    end

    def parse_with_count(res)
      {results: res, count: res.size}
    end
  end
end
