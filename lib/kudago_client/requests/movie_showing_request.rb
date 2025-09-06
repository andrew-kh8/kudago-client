# frozen_string_literal: true

require_relative "base_request"

module KudagoClient
  module Requests
    class MovieShowingRequest < KudagoClient::Requests::BaseRequest
      PATH = "movie-showings/"

      def self.list(params = {})
        params.slice!(:lang, :page, :page_size, :fields, :expand, :order_by, :ids,
          :location, :actual_since, :actual_until, :place_id, :is_free)

        get(PATH, params)
      end

      def self.find(showing_id, params = {})
        params.slice!(:lang, :fields, :expand)
        get("#{PATH}#{showing_id}/", params)
      end
    end
  end
end
