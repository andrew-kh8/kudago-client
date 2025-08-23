require_relative "base_list"

module KudagoClient
  module EntitiesList
    class PlaceCategoriesList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::PlaceCategory
    end
  end
end
