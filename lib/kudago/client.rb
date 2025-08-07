# frozen_string_literal: true

require_relative "requests/location_request"
require_relative "entities/location"
require_relative "entities_list/location_list"

module Kudago
  class Client
    attr_accessor :api_version

    LANG = "ru"

    def initialize(lang: LANG)
      @api_version = api_version
      @lang = lang
    end
  end
end
