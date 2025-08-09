# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class LocationRequest < Kudago::Requests::BaseRequest
      PATH = "locations/"

      def self.list(params = {})
        params.slice!(:lang, :fields, :order_by)
        res = get(PATH, params)

        parse_response_urls({results: res, count: res.size})
      end

      def self.find(slug, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{slug}/", params)
      end
    end
  end
end
