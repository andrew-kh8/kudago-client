# frozen_string_literal: true

require_relative "image"

module Kudago
  module Entities
    class MovieShowing
      attr_accessor :lang, :id, :movie, :place, :datetime, :three_d, :imax, :four_dx, :original_language, :price

      def initialize(lang:, id:, movie:, place:, datetime:, three_d: false, imax: false, four_dx: false, original_language: nil, price: nil)
        @lang = lang
        @id = id
        @price = price

        @three_d = three_d
        @imax = imax
        @four_dx = four_dx
        @original_language = original_language

        @movie = Kudago::Entities::Movie.new(**movie, lang: lang) if movie.present?
        @place = Kudago::Entities::Place.new(**place, lang: lang) if place.present?
        @datetime = Time.at(datetime).to_datetime if datetime.present?
      end
    end
  end
end
