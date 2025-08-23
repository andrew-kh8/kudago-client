require_relative "base_list"

module KudagoClient
  module EntitiesList
    class EventCategoriesList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::EventCategory
    end
  end
end
