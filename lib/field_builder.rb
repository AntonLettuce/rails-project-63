# frozen_string_literal: true

require "active_support/core_ext/string/inflections"
require_relative "form_tags/button_tag"
require_relative "form_tags/input_tag"
require_relative "form_tags/textarea_tag"
require_relative "form_tags/label_tag"

module FieldBuilder
  class Builder
    attr_reader :fields, :user

    def initialize(user)
      @fields = []
      @user = user
    end

    def input(prop, as: :input, **attrs)
      label = LabelTag::Label.new(prop)
      text_tag = as == :text ? TextareaTag::Text : InputTag::Input
      text_field = text_tag.new(prop.to_s, user.public_send(prop), attrs)
      fields.push(label, text_field)
    end

    def submit(value = "Save")
      fields << ButtonTag::Button.new(value)
    end
  end
end
