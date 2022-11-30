# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "tag"

module HexletCode
  def self.form_for(user, url: '#')
    Tag.build("form", action: url, method: "post") do
    end
  end
end
