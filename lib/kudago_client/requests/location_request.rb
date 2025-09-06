# frozen_string_literal: true

require_relative "base_request"

module KudagoClient
  module Requests
    class LocationRequest < KudagoClient::Requests::BaseRequest
      PATH = "locations/"

      def self.list(params = {})
        params.slice!(:lang, :fields, :order_by)
        get(PATH, params)
      end

      def self.find(slug, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{slug}/", params)
      end
    end
  end
end
