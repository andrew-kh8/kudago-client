# frozen_string_literal: true

require_relative "base_request"

module Kudago
  module Requests
    class AgentRequest < Kudago::Requests::BaseRequest
      PATH = "agents/"

      def self.list(params = {})
        params.slice!(:lang, :text_format, :ids, :fields, :agent_type, :expand, :tags)
        parse_response_urls(get(PATH, params))
      end

      def self.find(agent_id, params = {})
        params.slice!(:lang, :text_format, :fields)
        get("#{PATH}#{agent_id}/", params)
      end
    end
  end
end
