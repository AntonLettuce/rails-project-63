# frozen_string_literal: true

require_relative 'form_tag'

module ButtonTag
  class Button < FormTag::FormTag
    def initialize(value)
      super()
      @tag = 'input'
      @options = {
        type: 'submit',
        value:
      }
    end
  end
end
