require_relative "base_list"

module KudagoClient
  module EntitiesList
    class NewsList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::News
    end
  end
end
