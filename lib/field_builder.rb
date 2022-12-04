# frozen_string_literal: true

require "active_support/core_ext/string/inflections"
require_relative "text"

module FieldBuilder
  class Builder
    attr_reader :fields, :user

    def initialize(user)
      @fields = []
      @user = user
    end

    def input(prop, as: :input, **attrs)
      text_field = "TextTags::#{as.to_s.capitalize}".constantize.new(prop.to_s, user.public_send(prop), attrs)
      fields << text_field
    end
  end
end
