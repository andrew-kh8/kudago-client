require_relative "../entities/news"
require_relative "../entities/event"
require_relative "../entities/place"
require_relative "../entities/list"
require_relative "../entities/list_item"
require_relative "../entities/movie"

module Kudago
  module EntitiesList
    class MultipleList
      attr_reader :items, :lang, :count, :next_url, :previous_url

      def initialize(results:, lang: "ru", count: nil, next_url: nil, previous_url: nil, item_params: {})
        @next_url = next_url
        @previous_url = previous_url
        @lang = lang
        @count = count || results.size

        @items = results.map do |item|
          item[:site_url] = item.delete(:item_url) if item.key?(:item_url) && item[:ctype] != "listitem"
          item[:publication_date] = item.delete(:date) if item.key?(:date)
          item[:images] = [item.delete(:first_image)].compact if item.key?(:first_image)
          item[:dates] = [item.delete(:daterange)].compact if item.key?(:daterange)

          parse_entity_class(item.delete(:ctype)).new(**item, **item_params, lang: lang)
        end
      end

      private

      def parse_entity_class(slug_type)
        case slug_type
        when "news"
          Kudago::Entities::News
        when "event"
          Kudago::Entities::Event
        when "place"
          Kudago::Entities::Place
        when "list"
          Kudago::Entities::List
        when "movie"
          Kudago::Entities::Movie
        when "listitem"
          Kudago::Entities::ListItem
        else
          raise "Unknown entity type: #{slug_type}"
        end
      end
    end
  end
end
