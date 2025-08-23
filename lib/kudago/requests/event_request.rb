# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class EventRequest < Kudago::Requests::BaseRequest
      PATH = "events/"

      def self.list(params = {})
        params.slice!(:lang, :page, :page_size, :fields, :expand, :order_by, :text_format, :ids, :location,
          :actual_since, :actual_until, :place_id, :parent_id, :is_free, :categories, :tags, :lon, :lat, :radius)

        parse_response_urls(get(PATH, params))
      end

      def self.find(event_id, params = {})
        params.slice!(:lang, :fields, :expand, :text_format)
        get("#{PATH}#{event_id}/", params)
      end

      def self.comments(event_id, params = {})
        params.slice!(:lang, :page, :page_size, :fields, :order_by, :ids)
        parse_response_urls(get("#{PATH}#{event_id}/comments/", params))
      end

      def self.comment(event_id, comment_id, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{event_id}/comments/#{comment_id}/", params)
      end
    end
  end
end
