# frozen_string_literal: true

module Kudago
  module Entities
    class Place
      attr_reader :id, :lang, :title, :slug, :images, :address, :timetable, :phone, :description, :site_url, :is_stub,
        :body_text, :text_format, :disable_comments, :foreign_url, :coords, :subway, :favorites_count, :comments_count,
        :is_closed, :categories, :short_title, :tags, :location, :location_name, :age_restriction, :has_parking_lot

      def initialize(
        id: nil, lang: nil, title: nil, slug: nil, images: nil, address: nil, timetable: nil, phone: nil,
        description: nil, site_url: nil, is_stub: nil, body_text: nil, text_format: "html",
        disable_comments: nil, foreign_url: nil, coords: nil, subway: nil,
        favorites_count: nil, comments_count: nil, is_closed: nil, categories: nil,
        short_title: nil, tags: nil, location: nil, age_restriction: nil, has_parking_lot: nil
      )
        @lang = lang
        @id = id
        @slug = slug
        @title = title

        @address = address
        @timetable = timetable
        @phone = phone
        @coords = coords
        @subway = subway
        @is_closed = is_closed
        @location_name = location
        @location = Kudago::Entities::Location.new(slug: location, lang:) if location.present?

        @site_url = site_url
        @foreign_url = foreign_url

        @text_format = text_format
        @description = description
        @body_text = body_text

        @is_stub = is_stub

        @disable_comments = disable_comments
        @favorites_count = favorites_count
        @comments_count = comments_count

        @categories = categories
        @short_title = short_title
        @tags = tags
        @age_restriction = age_restriction
        @has_parking_lot = has_parking_lot

        @images = images&.map do |image|
          Kudago::Entities::Image.new(image: image[:image], thumbnails: image[:thumbnails], source: image[:source])
        end
      end
    end
  end
end
