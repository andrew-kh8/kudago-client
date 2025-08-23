require_relative "base_list"

module KudagoClient
  module EntitiesList
    class EventList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::Event
    end
  end
end
