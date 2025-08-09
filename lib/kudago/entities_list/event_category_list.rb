require_relative "base_list"
require_relative "../entities/location"

module Kudago
  module EntitiesList
    class EventCategoriesList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::EventCategory
    end
  end
end
