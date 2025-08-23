require_relative "base_list"

module KudagoClient
  module EntitiesList
    class ListList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::List
    end
  end
end
