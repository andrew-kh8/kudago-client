# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class MovieShowingRequest < Kudago::Requests::BaseRequest
      PATH = "movie-showings/"

      def self.list(params = {})
        params.slice!(:lang, :page, :page_size, :fields, :expand, :order_by, :ids,
          :location, :actual_since, :actual_until, :place_id, :is_free)

        parse_response_urls(get(PATH, params))
      end

      def self.find(showing_id, params = {})
        params.slice!(:lang, :fields, :expand)
        get("#{PATH}#{showing_id}/", params)
      end
    end
  end
end
