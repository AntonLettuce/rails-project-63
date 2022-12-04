# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "tag"
require_relative "field_builder"

module HexletCode
  include FieldBuilder

  def self.form_for(user, url: "#")
    builder = Builder.new(user)
    Tag.build("form", action: url, method: "post") do
      if block_given?
        yield(builder).map do |field|
          children = field.class.method_defined?(:children) ? proc { field.children } : nil
          Tag.build(field.tag, field.options, &children)
        end.join
      end
    end
  end
end
