# frozen_string_literal: true

require_relative 'form_tags/button_tag'
require_relative 'form_tags/input_tag'
require_relative 'form_tags/textarea_tag'
require_relative 'form_tags/label_tag'

module FieldBuilder
  class Builder
    attr_reader :fields, :entity

    def initialize(entity)
      @fields = []
      @entity = entity
    end

    def input(prop, as: :input, **attrs)
      label = LabelTag::Label.new(prop)
      text_tag = as == :text ? TextareaTag::Text : InputTag::Input
      text_field = text_tag.new(prop.to_s, entity.public_send(prop), attrs)
      fields.push(label, text_field)
    end

    def submit(value = 'Save')
      fields << ButtonTag::Button.new(value)
    end
  end
end
