# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class LocationRequest < Kudago::Requests::BaseRequest
      PATH = "locations/"

      def self.list(params = {})
        get(PATH, params)
      end

      def self.find(slug, params = {})
        get("#{PATH}#{slug}/", params)
      end
    end
  end
end
