require_relative "base_list"

module Kudago
  module EntitiesList
    class MovieShowingList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::MovieShowing
    end
  end
end
