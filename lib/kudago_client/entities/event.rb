# frozen_string_literal: true

require_relative "image"

require "date"

module KudagoClient
  module Entities
    class Event
      EventDate = Struct.new(:start_date, :start_time, :start, :end_date, :end_time, :end, :is_continuous,
        :is_endless, :is_startless, :schedules, :use_place_schedule) do
          def start
            Time.at(self[:start]).to_datetime if self[:start]
          end

          def end
            Time.at(self[:end]).to_datetime if self[:end]
          end
        end

      Participant = Struct.new(:role, :agent)

      attr_accessor :lang, :id, :publication_date, :body_text, :title, :slug, :description, :tagline, :age_restriction,
        :price, :is_free, :favorites_count, :comments_count, :site_url, :short_title, :disable_comments,
        :dates, :place, :location, :categories, :images, :tags, :participants

      def initialize(lang:, id: nil, publication_date: nil, body_text: nil, title: nil, slug: nil,
        description: nil, tagline: nil, age_restriction: nil, price: nil, is_free: false, favorites_count: nil,
        comments_count: nil, site_url: nil, short_title: nil, disable_comments: nil, dates: [], place: nil,
        location: nil, categories: [], images: [], tags: [], participants: [])
        @lang = lang
        @id = id

        @publication_date = Time.at(1467993495).to_datetime if publication_date
        @body_text = body_text
        @title = title
        @slug = slug
        @description = description
        @tagline = tagline
        @age_restriction = age_restriction
        @price = price
        @is_free = is_free
        @favorites_count = favorites_count
        @comments_count = comments_count
        @site_url = site_url
        @short_title = short_title
        @disable_comments = disable_comments
        @tags = tags

        @categories = categories&.map do |category_name|
          Entities::EventCategory.new(name: category_name, lang: lang)
        end

        @participants = participants&.map do |participant|
          Participant.new(
            Role.new(**participant[:role], lang: lang),
            Agent.new(**participant[:agent], lang: lang)
          )
        end

        @dates = dates&.map do |date|
          EventDate.new(
            start_date: date[:start_date],
            start_time: date[:start_time],
            start: date[:start],
            end_date: date[:end_date],
            end_time: date[:end_time],
            end: date[:end],
            is_continuous: date[:is_continuous],
            is_endless: date[:is_endless],
            is_startless: date[:is_startless],
            schedules: date[:schedules],
            use_place_schedule: date[:use_place_schedule]
          )
        end

        @place = Place.new(**place, lang: lang) if place
        @location = Location.new(**location, lang: lang) if location

        @images = images&.map do |image|
          KudagoClient::Entities::Image.new(image: image[:image], thumbnails: image[:thumbnails], source: image[:source])
        end
      end
    end
  end
end
