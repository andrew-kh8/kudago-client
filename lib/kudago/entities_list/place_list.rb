require_relative "base_list"

module Kudago
  module EntitiesList
    class PlaceList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Place
    end
  end
end
