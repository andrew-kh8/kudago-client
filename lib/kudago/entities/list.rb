# frozen_string_literal: true

require_relative "image"
require_relative "../entities_list/multiple_list"

require "date"

module Kudago
  module Entities
    class List
      attr_accessor :lang, :id, :ctype, :slug, :title, :publication_date, :favorites_count, :comments_count, :description,
        :body_text, :site_url, :item_url, :disable_comments, :items, :images

      def initialize(lang:, id: nil, ctype: "list", slug: nil, title: nil, publication_date: nil, favorites_count: nil,
        comments_count: nil, description: nil, body_text: nil, site_url: nil, item_url: nil, disable_comments: nil,
        items: [], images: [])
        @lang = lang
        @id = id
        @ctype = ctype
        @slug = slug
        @title = title
        @favorites_count = favorites_count
        @comments_count = comments_count
        @description = description
        @body_text = body_text
        @site_url = site_url
        @item_url = item_url
        @disable_comments = disable_comments
        @items = Kudago::EntitiesList::MultipleList.new(items, lang: lang) if items

        @publication_date = Time.at(publication_date).to_datetime if publication_date
        @images = images&.map { |img| Image.new(**img) }
      end
    end
  end
end
