require_relative "base_list"

module KudagoClient
  module EntitiesList
    class MovieList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::Movie
    end
  end
end
