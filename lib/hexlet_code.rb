# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'

module HexletCode
  autoload 'FieldBuilder', 'field_builder'

  def self.form_for(entity, url: '#')
    form_props = {
      tag: 'form',
      options: {
        action: url,
        method: 'post'
      }
    }
    builder = FieldBuilder::Builder.new(entity)
    Tag.build(form_props[:tag], form_props[:options]) do
      if block_given?
        yield(builder).map do |field|
          children = field.class.method_defined?(:children) ? proc { field.children } : nil
          Tag.build(field.tag, field.options, &children)
        end.join
      end
    end
  end
end
