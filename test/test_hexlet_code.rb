# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @User = Struct.new(:name, :job, keyword_init: true)
    @user = @User.new(name: "Anton", job: "Frontend Developer")
  end

  def test_form_for_without_url
    result = HexletCode.form_for @user
    assert_equal '<form action="#" method="post"></form>', result
  end

  def test_form_for_with_url
    result = HexletCode.form_for @user, url: "/users"
    assert_equal '<form action="/users" method="post"></form>', result
  end
end
