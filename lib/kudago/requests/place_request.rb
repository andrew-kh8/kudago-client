# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class PlaceRequest < Kudago::Requests::BaseRequest
      PATH = "places/"

      def self.list(params = {})
        params.slice!(:lang, :fields, :page, :page_size, :expand, :order_by, :text_format, :ids, :location,
          :has_showings, :showing_since, :showing_until, :is_free, :categories, :tags, :parent_id,
          :lon, :lat, :radius)

        parse_response_urls(get(PATH, params))
      end

      def self.find(place_id, params = {})
        params.slice!(:lang, :fields, :expand, :text_format)
        get("#{PATH}#{place_id}/", params)
      end

      def self.comments(place_id, params = {})
        params.slice!(:lang, :place_id, :page, :page_size, :fields, :order_by, :ids)
        parse_response_urls(get("#{PATH}#{place_id}/comments/", params))
      end
    end
  end
end
