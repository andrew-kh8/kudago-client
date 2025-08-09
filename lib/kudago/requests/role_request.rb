# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class RoleRequest < Kudago::Requests::BaseRequest
      PATH = "agent-roles/"

      def self.list(params = {})
        params.slice!(:lang, :fields)
        parse_response_urls(get(PATH, params))
      end

      def self.find(agent_id, params = {})
        params.slice!(:lang, :fields)
        get("#{PATH}#{agent_id}/", params)
      end
    end
  end
end
