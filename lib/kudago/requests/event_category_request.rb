# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class EventCategoryRequest < Kudago::Requests::BaseRequest
      PATH = "event-categories/"

      def self.list(params = {})
        params.slice!(:lang, :fields, :order_by)
        res = get(PATH, params)

        parse_response_urls({results: res, count: res.size})
      end

      def self.find(event_category_id, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{event_category_id}/", params)
      end
    end
  end
end
