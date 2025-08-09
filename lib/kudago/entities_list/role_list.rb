require_relative "base_list"
require_relative "../entities/role"

module Kudago
  module EntitiesList
    class RoleList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Role
    end
  end
end
