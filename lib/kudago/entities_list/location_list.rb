require_relative "base_list"

module Kudago
  module EntitiesList
    class LocationList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Location

      def find_by_slug(slug)
        @items.find { |location| location.slug == slug }
      end
    end
  end
end
