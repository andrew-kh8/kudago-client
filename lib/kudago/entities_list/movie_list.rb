require_relative "base_list"

module Kudago
  module EntitiesList
    class MovieList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Movie
    end
  end
end
