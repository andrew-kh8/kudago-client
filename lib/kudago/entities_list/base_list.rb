module Kudago
  module EntitiesList
    class BaseList
      attr_reader :count, :next_url, :previous_url, :results

      def initialize(count:, next_url:, previous_url:, results:, lang: "ru")
        @count = count
        @next = next
        @previous = previous
        @results = results.map do |item|
          self.class.entity_class.new(**item, lang: lang)
        end
      end
    end
  end
end
