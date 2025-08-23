require_relative "base_list"

module KudagoClient
  module EntitiesList
    class RoleList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::Role
    end
  end
end
