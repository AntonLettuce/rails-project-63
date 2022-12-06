# frozen_string_literal: true

module TextareaTag
  class Text < FormTag::FormTag
    attr_reader :children

    def initialize(prop, value, attrs)
      super()
      @tag = 'textarea'
      @options = {
        name: prop,
        cols: 20,
        rows: 40
      }.merge!(attrs)
      @children = value
    end
  end
end
