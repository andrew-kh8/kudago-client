require_relative "base_list"

module KudagoClient
  module EntitiesList
    class LocationList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::Location

      def find_by_slug(slug)
        @items.find { |location| location.slug == slug }
      end
    end
  end
end
