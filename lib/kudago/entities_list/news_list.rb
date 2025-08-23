require_relative "base_list"

module Kudago
  module EntitiesList
    class NewsList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::News
    end
  end
end
