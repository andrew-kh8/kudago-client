# frozen_string_literal: true

require_relative "requests/location_request"
require_relative "entities/location"
require_relative "entities_list/location_list"
require_relative "requests/agent_request"
require_relative "entities_list/agent_list"
require_relative "entities/agent"

module Kudago
  class Client
    attr_accessor :api_version

    LANG = "ru"

    def initialize(lang: LANG)
      @api_version = api_version
      @lang = lang
    end

    # ENTITY METHODS

    def agent(agent_id, params = {})
      res = Requests::AgentRequest.find(agent_id, params)
      Kudago::Entities::Agent.new(**res, lang: entity_lang(params))
    end

    def location(slug, params = {})
      res = Requests::LocationRequest.find(slug, params)
      Kudago::Entities::Location.new(**res, lang: entity_lang(params))
    end

    # LIST METHODS

    def agents(params = {})
      res = Requests::AgentRequest.list(params)
      Kudago::EntitiesList::AgentList.new(**res, lang: entity_lang(params))
    end

    def locations(params = {})
      res = Requests::LocationRequest.list(params)
      Kudago::EntitiesList::LocationList.new(res, lang: entity_lang(params))
    end

    private

    def entity_lang(params)
      params[:lang] || @lang
    end
  end
end
