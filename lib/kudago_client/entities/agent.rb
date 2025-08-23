# frozen_string_literal: true

require_relative "image"

module KudagoClient
  module Entities
    class Agent
      # id - идентификатор
      # title - название
      # slug - слаг
      # favorites_count - сколько пользователей добавило событие в избранное
      # comments_count - число комментариев к событию
      # description - описание
      # body_text - полное описание
      # site_url - адрес события на сайте kudago.com
      # disable_comments - выключены ли комментарии
      # ctype - тип объекта
      # images - картинки объекта
      # agent_type - тип агента
      # rank - рейтинг объекта
      # participations - список участий агента

      attr_reader :lang, :id, :title, :slug, :favorites_count, :comments_count, :description, :body_text,
        :site_url, :disable_comments, :ctype, :images, :agent_type, :rank, :participations, :text_format, :is_stub

      def initialize(
        lang:, text_format: "html", id: nil, title: nil, slug: nil, favorites_count: nil, comments_count: nil,
        description: nil, body_text: nil, site_url: nil, disable_comments: nil, ctype: nil, images: nil,
        agent_type: nil, rank: nil, participations: nil, is_stub: nil
      )
        @lang = lang
        @id = id

        @agent_type = agent_type
        @body_text = body_text
        @comments_count = comments_count
        @ctype = ctype
        @description = description
        @disable_comments = disable_comments
        @favorites_count = favorites_count
        @is_stub = is_stub
        @participations = participations # participant entity ???
        @rank = rank
        @site_url = site_url
        @slug = slug
        @text_format = text_format
        @title = title

        @images = images&.map do |image|
          KudagoClient::Entities::Image.new(image: image[:image], thumbnails: image[:thumbnails], source: image[:source])
        end
      end
    end
  end
end
