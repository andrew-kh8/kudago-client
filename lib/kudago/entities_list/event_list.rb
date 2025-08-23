require_relative "base_list"

module Kudago
  module EntitiesList
    class EventList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Event
    end
  end
end
