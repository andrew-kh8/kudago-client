# frozen_string_literal: true

require_relative "base_request"

module KudagoClient
  module Requests
    class EventOfTheDayRequest < KudagoClient::Requests::BaseRequest
      PATH = "events-of-the-day/"
      DIFFERENT_ATTRS = [:ctype, :daterange, :first_image, :title, :date, :location, :item_url].freeze

      def self.list(params = {})
        params.slice!(:lang, :page, :page_size, :fields, :expand, :text_format, :location, :date)
        res = get(PATH, params)

        res[:results] = res[:results].map do |event_data|
          parse_event_data(event_data)
        end

        parse_response_urls(res)
      end

      private_class_method

      def self.parse_event_data(event_data)
        attr_diff = event_data[:object].slice(*DIFFERENT_ATTRS)
        event = event_data[:object].except(*DIFFERENT_ATTRS)

        event[:location] = {slug: event_data[:location]}
        event[:dates] = [attr_diff[:daterange] || {start_date: event_data[:date]}]
        event[:title] = event_data[:title]
        event[:images] = [attr_diff[:first_image]] if attr_diff[:first_image]
        event[:site_url] = attr_diff[:item_url] if attr_diff[:item_url]
        event
      end
    end
  end
end
