require_relative "base_list"

module KudagoClient
  module EntitiesList
    class AgentList < KudagoClient::EntitiesList::BaseList
      entity_class KudagoClient::Entities::Agent

      def find_by_id(id)
        @items.find { |agent| agent.id == id }
      end
    end
  end
end
