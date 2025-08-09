# frozen_string_literal: true

require_relative "requests/location_request"
require_relative "requests/agent_request"
require_relative "requests/role_request"
require_relative "requests/event_category_request"
require_relative "requests/place_category_request"
require_relative "requests/movie_request"

require_relative "entities/location"
require_relative "entities/agent"
require_relative "entities/role"
require_relative "entities/event_category"
require_relative "entities/place_category"
require_relative "entities/movie"

require_relative "entities_list/location_list"
require_relative "entities_list/agent_list"
require_relative "entities_list/role_list"
require_relative "entities_list/event_category_list"
require_relative "entities_list/place_category_list"
require_relative "entities_list/movie_list"

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

    def role(role_id, params = {})
      res = Requests::RoleRequest.find(role_id, params)
      Kudago::Entities::Role.new(**res, lang: entity_lang(params))
    end

    def event_category(event_category_id, params = {})
      res = Requests::EventCategoryRequest.find(event_category_id, params)
      Kudago::Entities::EventCategory.new(**res, lang: entity_lang(params))
    end

    def place_category(place_category_id, params = {})
      res = Requests::PlaceCategoryRequest.find(place_category_id, params)
      Kudago::Entities::PlaceCategory.new(**res, lang: entity_lang(params))
    end

    def movie(movie_id, params = {})
      res = Requests::MovieRequest.find(movie_id, params)
      Kudago::Entities::Movie.new(**res, lang: entity_lang(params))
    end

    # LIST METHODS

    def agents(params = {})
      res = Requests::AgentRequest.list(params)
      Kudago::EntitiesList::AgentList.new(**res, lang: entity_lang(params))
    end

    def locations(params = {})
      res = Requests::LocationRequest.list(params)
      Kudago::EntitiesList::LocationList.new(**res, lang: entity_lang(params))
    end

    def roles(params = {})
      res = Requests::RoleRequest.list(params)
      Kudago::EntitiesList::RoleList.new(**res, lang: entity_lang(params))
    end

    def event_categories(params = {})
      res = Requests::EventCategoryRequest.list(params)
      Kudago::EntitiesList::EventCategoriesList.new(**res, lang: entity_lang(params))
    end

    def place_categories(params = {})
      res = Requests::PlaceCategoryRequest.list(params)
      Kudago::EntitiesList::PlaceCategoriesList.new(**res, lang: entity_lang(params))
    end

    def movies(params = {})
      res = Requests::MovieRequest.list(params)
      Kudago::EntitiesList::MovieList.new(**res, lang: entity_lang(params))
    end

    private

    def entity_lang(params)
      params[:lang] || @lang
    end
  end
end
