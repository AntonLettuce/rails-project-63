# frozen_string_literal: true

module InputTag
  class Input < FormTag::FormTag
    def initialize(prop, value, attrs)
      super()
      @tag = 'input'
      @options = {
        name: prop,
        type: 'text',
        value: value
      }.merge!(attrs)
    end
  end
end
