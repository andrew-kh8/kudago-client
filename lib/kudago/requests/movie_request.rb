# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class MovieRequest < Kudago::Requests::BaseRequest
      PATH = "movies/"

      def self.list(params = {})
        params.slice!(:lang, :page, :page_size, :fields, :expand, :order_by, :text_format, :ids, :tags,
          :location, :premiering_in_location, :is_free, :place_id, :actual_since, :actual_until)

        parse_response_urls(get(PATH, params))
      end

      def self.find(movie_id, params = {})
        params.slice!(:lang, :fields, :expand, :text_format)
        get("#{PATH}#{movie_id}/", params)
      end
    end
  end
end
