require_relative "base_list"

module KudagoClient
  module EntitiesList
    class PlaceList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::Place
    end
  end
end
