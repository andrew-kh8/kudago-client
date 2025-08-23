require_relative "base_list"

module KudagoClient
  module EntitiesList
    class MovieShowingList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::MovieShowing
    end
  end
end
