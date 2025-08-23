require_relative "base_list"

module Kudago
  module EntitiesList
    class ListList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::List
    end
  end
end
