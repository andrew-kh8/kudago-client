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
require_relative "requests/event_of_the_day_request"
require_relative "requests/list_request"
require_relative "requests/search_request"
require_relative "requests/base_request"

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
require_relative "entities/list"

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
require_relative "entities_list/list_list"
require_relative "entities_list/multiple_list"

module KudagoClient
  class Client
    attr_accessor :lang

    class << self
      attr_accessor :default_lang

      def config &blk
        blk.call(self) if block_given?
      end
    end

    def initialize(lang: nil)
      @lang = lang || self.class.default_lang
    end

    # PAGE METHODS

    def next_page(list, params = {})
      return nil if list.next_url.nil?

      res = Requests::BaseRequest.get(list.next_url, params)
      list.class.new(**res.data, lang: entity_lang(params))
    end

    def previous_page(list, params = {})
      return nil if list.previous_url.nil?

      res = Requests::BaseRequest.get(list.previous_url, params)
      list.class.new(**res.data, lang: entity_lang(params))
    end

    # ENTITY METHODS

    def agent(agent_id, params = {})
      res = Requests::AgentRequest.find(agent_id, params)
      KudagoClient::Entities::Agent.new(**res.data, lang: entity_lang(params))
    end

    def location(slug, params = {})
      res = Requests::LocationRequest.find(slug, params)
      KudagoClient::Entities::Location.new(**res.data, lang: entity_lang(params))
    end

    def role(role_id, params = {})
      res = Requests::RoleRequest.find(role_id, params)
      KudagoClient::Entities::Role.new(**res.data, lang: entity_lang(params))
    end

    def event_category(event_category_id, params = {})
      res = Requests::EventCategoryRequest.find(event_category_id, params)
      KudagoClient::Entities::EventCategory.new(**res.data, lang: entity_lang(params))
    end

    def place_category(place_category_id, params = {})
      res = Requests::PlaceCategoryRequest.find(place_category_id, params)
      KudagoClient::Entities::PlaceCategory.new(**res.data, lang: entity_lang(params))
    end

    def movie(movie_id, params = {})
      res = Requests::MovieRequest.find(movie_id, params)
      KudagoClient::Entities::Movie.new(**res.data, lang: entity_lang(params))
    end

    def showing(showing_id, params = {})
      res = Requests::MovieShowingRequest.find(showing_id, params)
      KudagoClient::Entities::MovieShowing.new(**res.data, lang: entity_lang(params))
    end

    def place(place_id, params = {})
      res = Requests::PlaceRequest.find(place_id, params)
      KudagoClient::Entities::Place.new(**res.data, lang: entity_lang(params))
    end

    def piece_news(news_id, params = {})
      res = Requests::NewsRequest.find(news_id, params)
      KudagoClient::Entities::News.new(**res.data, lang: entity_lang(params))
    end

    def news_comment(news_id, comment_id, params = {})
      res = Requests::NewsRequest.comment(news_id, comment_id, params)
      KudagoClient::Entities::Comment.new(**res.data, lang: entity_lang(params))
    end

    def event(event_id, params = {})
      res = Requests::EventRequest.find(event_id, params)
      KudagoClient::Entities::Event.new(**res.data, lang: entity_lang(params))
    end

    def event_comment(event_id, comment_id, params = {})
      res = Requests::EventRequest.comment(event_id, comment_id, params)
      KudagoClient::Entities::Comment.new(**res.data, lang: entity_lang(params))
    end

    def list(list_id, params = {})
      res = Requests::ListRequest.find(list_id, params)
      KudagoClient::Entities::List.new(**res.data, lang: entity_lang(params))
    end

    def list_comment(list_id, comment_id, params = {})
      res = Requests::ListRequest.comment(list_id, comment_id, params)
      KudagoClient::Entities::Comment.new(**res.data, lang: entity_lang(params))
    end

    # LIST METHODS

    def agents(params = {})
      res = Requests::AgentRequest.list(params)
      KudagoClient::EntitiesList::AgentList.new(**res.data, lang: entity_lang(params))
    end

    def locations(params = {})
      res = Requests::LocationRequest.list(params)
      KudagoClient::EntitiesList::LocationList.new(**res.data, lang: entity_lang(params))
    end

    def roles(params = {})
      res = Requests::RoleRequest.list(params)
      KudagoClient::EntitiesList::RoleList.new(**res.data, lang: entity_lang(params))
    end

    def event_categories(params = {})
      res = Requests::EventCategoryRequest.list(params)
      KudagoClient::EntitiesList::EventCategoriesList.new(**res.data, lang: entity_lang(params))
    end

    def place_categories(params = {})
      res = Requests::PlaceCategoryRequest.list(params)
      KudagoClient::EntitiesList::PlaceCategoriesList.new(**res.data, lang: entity_lang(params))
    end

    def movies(params = {})
      res = Requests::MovieRequest.list(params)
      KudagoClient::EntitiesList::MovieList.new(**res.data, lang: entity_lang(params))
    end

    def movie_comments(movie_id, params = {})
      res = Requests::MovieRequest.comments(movie_id, params)
      KudagoClient::EntitiesList::CommentList.new(**res.data, lang: entity_lang(params))
    end

    def showings(params = {})
      res = Requests::MovieShowingRequest.list(params)
      KudagoClient::EntitiesList::MovieShowingList.new(**res.data, lang: entity_lang(params))
    end

    def movie_showings(movie_id, params = {})
      res = Requests::MovieRequest.showings(movie_id, params)
      KudagoClient::EntitiesList::MovieShowingList.new(**res.data, item_params: {movie: {id: movie_id}}, lang: entity_lang(params))
    end

    def places(params = {})
      res = Requests::PlaceRequest.list(params)
      KudagoClient::EntitiesList::PlaceList.new(**res.data, lang: entity_lang(params))
    end

    def place_comments(place_id, params = {})
      res = Requests::PlaceRequest.comments(place_id, params)
      KudagoClient::EntitiesList::CommentList.new(**res.data, lang: entity_lang(params))
    end

    def news(params = {})
      res = Requests::NewsRequest.list(params)
      KudagoClient::EntitiesList::NewsList.new(**res.data, lang: entity_lang(params))
    end

    def news_comments(news_id, params = {})
      res = Requests::NewsRequest.comments(news_id, params)
      KudagoClient::EntitiesList::CommentList.new(**res.data, lang: entity_lang(params))
    end

    def events(params = {})
      res = Requests::EventRequest.list(params)
      KudagoClient::EntitiesList::EventList.new(**res.data, lang: entity_lang(params))
    end

    def event_comments(event_id, params = {})
      res = Requests::EventRequest.comments(event_id, params)
      KudagoClient::EntitiesList::CommentList.new(**res.data, lang: entity_lang(params))
    end

    def events_of_the_day(params = {})
      res = Requests::EventOfTheDayRequest.list(params)
      KudagoClient::EntitiesList::EventList.new(**res.data, lang: entity_lang(params))
    end

    def lists(params = {})
      res = Requests::ListRequest.list(params)
      KudagoClient::EntitiesList::ListList.new(**res.data, lang: entity_lang(params))
    end

    def list_comments(list_id, params = {})
      res = Requests::ListRequest.comments(list_id, params)
      KudagoClient::EntitiesList::CommentList.new(**res.data, lang: entity_lang(params))
    end

    def search(query, params = {})
      res = Requests::SearchRequest.search(query, params)
      KudagoClient::EntitiesList::MultipleList.new(**res.data, lang: entity_lang(params))
    end

    private

    def entity_lang(params)
      params[:lang] || @lang
    end
  end
end
