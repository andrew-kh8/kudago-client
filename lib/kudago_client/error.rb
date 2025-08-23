# frozen_string_literal: true

module KudagoClient
  class Error < StandardError
    attr_reader :status, :reason

    def initialize(message:, status: nil, reason: nil)
      super(message)

      @status = status
      @reason = reason
    end
  end
end
