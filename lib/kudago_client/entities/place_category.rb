# frozen_string_literal: true

module KudagoClient
  module Entities
    class PlaceCategory
      attr_reader :id, :slug, :name, :lang

      def initialize(id: nil, slug: nil, name: nil, lang: "ru")
        @id = id
        @slug = slug
        @name = name
        @lang = lang
      end
    end
  end
end
