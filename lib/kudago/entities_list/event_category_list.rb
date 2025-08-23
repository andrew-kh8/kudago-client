require_relative "base_list"

module Kudago
  module EntitiesList
    class EventCategoriesList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::EventCategory
    end
  end
end
