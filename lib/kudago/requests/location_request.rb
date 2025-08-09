# frozen_string_literal: true

require "active_support/core_ext/hash"
require_relative "base_request"

module Kudago
  module Requests
    class LocationRequest < Kudago::Requests::BaseRequest
      PATH = "locations/"

      def self.list(params = {})
        params.slice!(:lang, :fields, :order_by)
        get(PATH, params)
      end

      def self.find(slug, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{slug}/", params)
      end
    end
  end
end
