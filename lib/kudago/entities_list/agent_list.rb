require_relative "base_list"

module Kudago
  module EntitiesList
    class AgentList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Agent

      def find_by_id(id)
        @items.find { |agent| agent.id == id }
      end
    end
  end
end
