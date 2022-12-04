# frozen_string_literal: true

module TextTags
  class TextTag
    attr_reader :tag, :options
  end

  class Input < TextTag
    def initialize(prop, value, attrs)
      @tag = "input"
      @options = {
        name: prop,
        type: "text",
        value: value
      }.merge!(attrs)
    end
  end

  class Text < TextTag
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
end
