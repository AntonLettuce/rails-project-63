# frozen_string_literal: true

module FormTags
  class FormTag
    attr_reader :tag, :options
  end

  class Input < FormTag
    def initialize(prop, value, attrs)
      @tag = "input"
      @options = {
        name: prop,
        type: "text",
        value: value
      }.merge!(attrs)
    end
  end

  class Text < FormTag
    attr_reader :children

    def initialize(prop, value, attrs)
      @tag = "textarea"
      @options = {
        name: prop,
        cols: 20,
        rows: 40
      }.merge!(attrs)
      @children = value
    end
  end

  class Label < FormTag
    attr_reader :children

    def initialize(prop)
      @tag = "label"
      @options = {
        for: prop
      }
      @children = prop.capitalize
    end
  end

  class Button < FormTag
    def initialize(value)
      @tag = "input"
      @options = {
        type: "submit",
        value: value
      }
    end
  end
end
