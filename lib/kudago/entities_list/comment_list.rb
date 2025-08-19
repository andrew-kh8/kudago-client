require_relative "base_list"

module Kudago
  module EntitiesList
    class CommentList < Kudago::EntitiesList::BaseList
      entity_class Kudago::Entities::Comment
    end
  end
end
