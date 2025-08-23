# frozen_string_literal: true

module KudagoClient
  module Entities
    class ListItem
      attr_accessor :lang, :id, :ctype, :title, :description, :item_url, :age_restriction

      def initialize(lang:, id: nil, ctype: "listitem", title: nil, description: nil, item_url: nil, age_restriction: nil)
        @lang = lang
        @id = id
        @ctype = ctype
        @title = title
        @description = description
        @item_url = item_url
        @age_restriction = age_restriction
      end
    end
  end
end
