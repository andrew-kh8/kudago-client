# frozen_string_literal: true

require_relative "image"

require "date"

module Kudago
  module Entities
    class Movie
      Genre = Data.define(:id, :slug, :name, :lang)

      # id - идентификатор
      # site_url - адрес фильма на сайте kudago.com
      # publication_date - дата публикации
      # slug - слаг
      # title - название
      # description - описание
      # body_text - полное описание
      # is_editors_choice - является ли выбоором редакции
      # favorites_count - число пользователей, добавивших фильм в избранное
      # genres - список жанров
      # comments_count - число комментариев
      # original_title - оригинальное название
      # locale - язык оригинала
      # country - страна оригинала
      # year - год выпуска
      # language - язык оригинала
      # running_time - продолжительность
      # budget_currency - бюджет (валюта)
      # budget - бюджет
      # mpaa_rating - рейтинг MPAA
      # age_restriction - возрастное ограничение
      # stars - актеры
      # director - режиссер
      # writer - сценарист
      # awards - награды
      # trailer - трейлер
      # images - галерея картинок
      # poster - постер
      # url - сайт фильма
      # imdb_url - ссылка на страницу фильма на imdb.com
      # imdb_rating - рейтинг фильма на сайте imdb.com
      #   disable_comments - ??

      attr_reader :id, :site_url, :publication_date, :slug, :title, :description, :body_text, :is_editors_choice,
        :favorites_count, :genres, :comments_count, :original_title, :locale, :country, :year, :language, :running_time,
        :budget_currency, :budget, :mpaa_rating, :age_restriction, :stars, :director, :writer, :awards, :trailer,
        :images, :poster, :url, :imdb_url, :imdb_rating, :disable_comments

      def initialize(
        lang:, text_format: "html", id: nil, site_url: nil, publication_date: nil, slug: nil, title: nil,
        description: nil, body_text: nil, is_editors_choice: nil, favorites_count: nil, genres: nil,
        original_title: nil, locale: nil, country: nil, year: nil, language: nil, running_time: nil,
        budget_currency: nil, budget: nil, mpaa_rating: nil, age_restriction: nil, stars: nil, director: nil,
        writer: nil, awards: nil, trailer: nil, images: nil, poster: nil, url: nil, imdb_url: nil,
        imdb_rating: nil, disable_comments: nil, comments_count: nil
      )
        @lang = lang
        @text_format = text_format
        @id = id

        @url = url
        @site_url = site_url
        @imdb_url = imdb_url
        @trailer = trailer

        @publication_date = Time.at(publication_date).to_date if publication_date

        @slug = slug
        @title = title
        @original_title = original_title
        @description = description
        @body_text = body_text

        @is_editors_choice = is_editors_choice
        @favorites_count = favorites_count
        @stars = stars

        @comments_count = comments_count
        @locale = locale
        @country = country
        @language = language

        @year = year
        @running_time = running_time
        @budget_currency = budget_currency
        @budget = budget

        @mpaa_rating = mpaa_rating
        @imdb_rating = imdb_rating
        @age_restriction = age_restriction

        @director = director
        @writer = writer
        @awards = awards

        @disable_comments = disable_comments

        @genres = genres&.map do |genre|
          Genre.new(id: genre[:id], slug: genre[:slug], name: genre[:name], lang: lang)
        end

        if poster
          @poster = Kudago::Entities::Image.new(
            image: poster[:image],
            thumbnails: poster[:thumbnails],
            source: poster[:source]
          )
        end

        @images = images&.map do |image|
          Kudago::Entities::Image.new(image: image[:image], thumbnails: image[:thumbnails], source: image[:source])
        end
      end
    end
  end
end
