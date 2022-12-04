# frozen_string_literal: true

require "active_support/core_ext/string/inflections"
require_relative "form_tags"

module FieldBuilder
  class Builder
    attr_reader :fields, :user

    def initialize(user)
      @fields = []
      @user = user
    end

    def input(prop, as: :input, **attrs)
      label = FormTags::Label.new(prop)
      text_field = "FormTags::#{as.to_s.capitalize}".constantize.new(prop.to_s, user.public_send(prop), attrs)
      fields.push(label, text_field)
    end

    def submit(value = "Save")
      fields << FormTags::Button.new(value)
    end
  end
end
