require_relative "../entities/location"

module Kudago
  module EntitiesList
    class LocationList
      attr_reader :lang, :locations

      def initialize(raw_locations, lang: "ru")
        @locations = raw_locations.map do |raw_location|
          Kudago::Entities::Location.new(**raw_location, lang: lang)
        end

        @lang = lang
      end

      def all
        @locations
      end

      def find_by_slug(slug)
        @locations.find { |location| location.slug == slug }
      end
    end
  end
end
