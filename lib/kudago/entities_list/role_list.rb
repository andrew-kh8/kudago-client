require_relative "base_list"

module Kudago
  module EntitiesList
    class RoleList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Role
    end
  end
end
