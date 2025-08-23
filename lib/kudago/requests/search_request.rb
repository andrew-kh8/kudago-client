# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class SearchRequest < Kudago::Requests::BaseRequest
      PATH = "search/"

      def self.search(query, params = {})
        params.slice!(:lang, :page, :page_size, :expand, :location, :ctype, :is_free, :include_inactual, :lat, :lon, :radius)
        params[:q] = query

        parse_response_urls(get(PATH, params))
      end
    end
  end
end
