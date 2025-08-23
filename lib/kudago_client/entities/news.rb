# frozen_string_literal: true

require_relative "image"

require "date"

module KudagoClient
  module Entities
    class News
      attr_accessor :lang, :id, :title, :publication_date, :slug, :place, :description, :body_text, :images, :site_url,
        :favorites_count, :comments_count, :disable_comments

      def initialize(lang:, id: nil, title: nil, publication_date: nil, slug: nil, place: nil, description: nil, body_text: nil,
        images: [], site_url: nil, favorites_count: 0, comments_count: 0, disable_comments: false)
        @lang = lang
        @id = id
        @title = title
        @slug = slug
        @description = description
        @body_text = body_text
        @site_url = site_url
        @favorites_count = favorites_count
        @comments_count = comments_count
        @disable_comments = disable_comments

        @publication_date = Time.at(publication_date).to_date if publication_date
        @place = KudagoClient::Entities::Place.new(**place, lang: lang) if place.present?
        @images = images.map { |img| KudagoClient::Entities::Image.new(**img) } if images.present?
      end
    end
  end
end
