# frozen_string_literal: true

module Kudago
  module Entities
    class Location
      attr_reader :slug, :name, :timezone, :coords, :language, :currency

      def initialize(lang:, slug: nil, name: nil, timezone: nil, coords: nil, language: nil, currency: nil)
        @lang = lang
        @slug = slug
        @name = name
        @timezone = timezone
        @coords = coords
        @language = language
        @currency = currency
      end

      def lat
        coords[:lat]
      end

      def lon
        coords[:lon]
      end
    end
  end
end
