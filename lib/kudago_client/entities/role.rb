# frozen_string_literal: true

module KudagoClient
  module Entities
    class Role
      # id - идентификатор
      # name - название роли
      # name_plural - название роли во множественном числе
      attr_reader :id, :slug, :name, :name_plural

      def initialize(id: nil, slug: nil, name: nil, name_plural: nil, lang: "ru")
        @id = id
        @slug = slug
        @name = name
        @name_plural = name_plural
        @lang = lang
      end
    end
  end
end
