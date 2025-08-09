# frozen_string_literal: true

module Kudago
  module Entities
    class Image
      attr_reader :image, :thumbnails, :source

      def initialize(image:, thumbnails: {}, source: {})
        @image = image
        @thumbnails = thumbnails
        @source = source
      end

      def thumbnail(size)
        @thumbnails[size]
      end

      def source_link
        @source[:link]
      end

      def source_name
        @source[:name]
      end
    end
  end
end
