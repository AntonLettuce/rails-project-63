# frozen_string_literal: true

module LabelTag
  class Label < FormTag::FormTag
    attr_reader :children

    def initialize(prop)
      super()
      @tag = "label"
      @options = {
        for: prop
      }
      @children = prop.capitalize
    end
  end
end
