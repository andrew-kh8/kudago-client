# frozen_string_literal: true

require_relative "requests/location_request"
require_relative "requests/agent_request"
require_relative "requests/role_request"
require_relative "requests/event_category_request"
require_relative "requests/place_category_request"
require_relative "requests/movie_request"
require_relative "requests/movie_showing_request"
require_relative "requests/place_request"
require_relative "requests/news_request"
require_relative "requests/event_request"

require_relative "entities/location"
require_relative "entities/agent"
require_relative "entities/role"
require_relative "entities/event_category"
require_relative "entities/place_category"
require_relative "entities/movie"
require_relative "entities/movie_showing"
require_relative "entities/place"
require_relative "entities/comment"
require_relative "entities/news"
require_relative "entities/event"

require_relative "entities_list/location_list"
require_relative "entities_list/agent_list"
require_relative "entities_list/role_list"
require_relative "entities_list/event_category_list"
require_relative "entities_list/place_category_list"
require_relative "entities_list/movie_list"
require_relative "entities_list/movie_showing_list"
require_relative "entities_list/place_list"
require_relative "entities_list/comment_list"
require_relative "entities_list/news_list"
require_relative "entities_list/event_list"

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

    def showing(showing_id, params = {})
      res = Requests::MovieShowingRequest.find(showing_id, params)
      Kudago::Entities::MovieShowing.new(**res, lang: entity_lang(params))
    end

    def place(place_id, params = {})
      res = Requests::PlaceRequest.find(place_id, params)
      Kudago::Entities::Place.new(**res, lang: entity_lang(params))
    end

    def piece_news(news_id, params = {})
      res = Requests::NewsRequest.find(news_id, params)
      Kudago::Entities::News.new(**res, lang: entity_lang(params))
    end

    def news_comment(news_id, comment_id, params = {})
      res = Requests::NewsRequest.comment(news_id, comment_id, params)
      Kudago::Entities::Comment.new(**res, lang: entity_lang(params))
    end

    def event(event_id, params = {})
      res = Requests::EventRequest.find(event_id, params)
      Kudago::Entities::Event.new(**res, lang: entity_lang(params))
    end

    def event_comment(event_id, comment_id, params = {})
      res = Requests::EventRequest.comment(event_id, comment_id, params)
      Kudago::Entities::Comment.new(**res, lang: entity_lang(params))
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

    def movie_comments(movie_id, params = {})
      res = Requests::MovieRequest.comments(movie_id, params)
      Kudago::EntitiesList::CommentList.new(**res, lang: entity_lang(params))
    end

    def showings(params = {})
      res = Requests::MovieShowingRequest.list(params)
      Kudago::EntitiesList::MovieShowingList.new(**res, lang: entity_lang(params))
    end

    def movie_showings(movie_id, params = {})
      res = Requests::MovieRequest.showings(movie_id, params)
      Kudago::EntitiesList::MovieShowingList.new(**res, item_params: {movie: {id: movie_id}}, lang: entity_lang(params))
    end

    def places(params = {})
      res = Requests::PlaceRequest.list(params)
      Kudago::EntitiesList::PlaceList.new(**res, lang: entity_lang(params))
    end

    def place_comments(place_id, params = {})
      res = Requests::PlaceRequest.comments(place_id, params)
      Kudago::EntitiesList::CommentList.new(**res, lang: entity_lang(params))
    end

    def news(params = {})
      res = Requests::NewsRequest.list(params)
      Kudago::EntitiesList::NewsList.new(**res, lang: entity_lang(params))
    end

    def news_comments(news_id, params = {})
      res = Requests::NewsRequest.comments(news_id, params)
      Kudago::EntitiesList::CommentList.new(**res, lang: entity_lang(params))
    end

    def events(params = {})
      res = Requests::EventRequest.list(params)
      Kudago::EntitiesList::EventList.new(**res, lang: entity_lang(params))
    end

    def event_comments(event_id, params = {})
      res = Requests::EventRequest.comments(event_id, params)
      Kudago::EntitiesList::CommentList.new(**res, lang: entity_lang(params))
    end

    private

    def entity_lang(params)
      params[:lang] || @lang
    end
  end
end
