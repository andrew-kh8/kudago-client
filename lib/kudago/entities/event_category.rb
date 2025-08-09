# frozen_string_literal: true

module Kudago
  module Entities
    class EventCategory
      attr_reader :id, :slug, :name

      def initialize(id: nil, slug: nil, name: nil, lang: "ru")
        @id = id
        @slug = slug
        @name = name
        @lang = lang
      end
    end
  end
end
