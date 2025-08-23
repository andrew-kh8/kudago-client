require_relative "base_list"

module KudagoClient
  module EntitiesList
    class CommentList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::Comment
    end
  end
end
