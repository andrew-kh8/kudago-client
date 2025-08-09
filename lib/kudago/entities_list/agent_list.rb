require_relative "base_list"
require_relative "../entities/agent"

module Kudago
  module EntitiesList
    class AgentList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Agent

      attr_reader :lang, :agents

      def all
        @agents
      end

      def find_by_id(id)
        @agents.find { |agent| agent.id == id }
      end
    end
  end
end
