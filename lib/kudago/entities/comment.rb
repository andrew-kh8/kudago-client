# frozen_string_literal: true

# require_relative "image"

module Kudago
  module Entities
    class Comment
      User = Struct.new(:name, :avatar_url)

      attr_accessor :lang, :id, :date_posted, :text, :user, :is_deleted, :replies_count, :reply_to, :thread

      def initialize(lang:, id: nil, date_posted: nil, text: nil, user: nil, is_deleted: false, replies_count: 0, reply_to: nil, thread: nil)
        @lang = lang
        @id = id
        @text = text
        @is_deleted = is_deleted
        @replies_count = replies_count
        @reply_to = reply_to
        @thread = thread

        @date_posted = Time.at(date_posted).to_datetime if date_posted.present?
        @user = User.new(user[:name], user[:avatar]) if user.present?
      end
    end
  end
end
