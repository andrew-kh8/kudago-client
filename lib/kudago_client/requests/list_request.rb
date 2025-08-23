# frozen_string_literal: true

require_relative "base_request"

module KudagoClient
  module Requests
    class ListRequest < KudagoClient::Requests::BaseRequest
      PATH = "lists/"

      def self.list(params = {})
        params.slice!(:lang, :page, :page_size, :fields, :expand, :order_by, :text_format, :ids, :tags, :location)
        parse_response_urls(get(PATH, params))
      end

      def self.find(list_id, params = {})
        params.slice!(:lang, :fields, :expand)
        get("#{PATH}#{list_id}/", params)
      end

      def self.comments(list_id, params = {})
        params.slice!(:lang, :page, :page_size, :fields, :order_by, :ids)
        parse_response_urls(get("#{PATH}#{list_id}/comments/", params))
      end

      def self.comment(list_id, comment_id, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{list_id}/comments/#{comment_id}/", params)
      end
    end
  end
end
