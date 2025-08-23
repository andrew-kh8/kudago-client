module Kudago
  module EntitiesList
    class BaseList
      attr_reader :count, :next_url, :previous_url, :items, :lang

      def initialize(count:, next_url:, previous_url:, results:, lang: "ru", item_params: {})
        @count = count
        @next = next_url
        @previous = previous_url
        @lang = lang

        @items = results.map do |item|
          self.class.get_entity_class.new(**item, **item_params, lang: lang)
        end
      end

      def ids
        @items.map(&:id)
      end

      class << self
        def entity_class(class_name = nil)
          @entity_class = class_name
        end

        def get_entity_class
          @entity_class || raise("Entity class not set for #{name}")
        end
      end
    end
  end
end
