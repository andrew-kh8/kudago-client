# frozen_string_literal: true

require_relative "base_request"

module KudagoClient
  module Requests
    class EventCategoryRequest < KudagoClient::Requests::BaseRequest
      PATH = "event-categories/"

      def self.list(params = {})
        params.slice!(:lang, :fields, :order_by)
        get(PATH, params)
      end

      def self.find(event_category_id, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{event_category_id}/", params)
      end
    end
  end
end
