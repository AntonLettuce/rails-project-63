# frozen_string_literal: true

module Tag
  def self.build(tag, params = [])
    attributes = params.map { |attribute, value| "#{attribute}=\"#{value}\"" }.join(" ")
    divider = attributes.empty? ? "" : " "
    content_w_closing_tag = "#{yield}</#{tag}>" if block_given?
    "<#{tag}#{divider}#{attributes}>#{content_w_closing_tag}"
  end
end
