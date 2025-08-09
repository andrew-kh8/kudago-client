require_relative "base_list"
require_relative "../entities/location"

module Kudago
  module EntitiesList
    class PlaceCategoriesList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::PlaceCategory
    end
  end
end
