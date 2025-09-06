# frozen_string_literal: true

require_relative "base_request"

module KudagoClient
  module Requests
    class PlaceCategoryRequest < KudagoClient::Requests::BaseRequest
      PATH = "place-categories/"

      def self.list(params = {})
        params.slice!(:lang, :fields, :order_by)
        get(PATH, params)
      end

      def self.find(place_category_id, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{place_category_id}/", params)
      end
    end
  end
end
