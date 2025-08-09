module Kudago
  module EntitiesList
    class BaseList
      attr_reader :count, :next_url, :previous_url, :items

      def initialize(count:, next_url:, previous_url:, results:, lang: "ru")
        @count = count
        @next = next_url
        @previous = previous_url
        @lang = lang

        @items = results.map do |item|
          @@entity_class.new(**item, lang: lang)
        end
      end

      def self.entity_class(class_name = nil)
        @@entity_class = class_name
      end
    end
  end
end
