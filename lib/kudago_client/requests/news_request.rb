# frozen_string_literal: true

require_relative "base_request"

module KudagoClient
  module Requests
    class NewsRequest < KudagoClient::Requests::BaseRequest
      PATH = "news/"

      def self.list(params = {})
        params.slice!(:lang, :page, :page_size, :fields, :expand, :order_by, :text_format, :ids, :tags,
          :location, :place_id, :actual_only)

        parse_response_urls(get(PATH, params))
      end

      def self.find(news_id, params = {})
        params.slice!(:lang, :fields, :expand, :text_format)
        get("#{PATH}#{news_id}/", params)
      end

      def self.comments(news_id, params = {})
        params.slice!(:lang, :page, :page_size, :fields, :order_by, :ids)
        parse_response_urls(get("#{PATH}#{news_id}/comments/", params))
      end

      def self.comment(news_id, comment_id, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{news_id}/comments/#{comment_id}/", params)
      end
    end
  end
end
