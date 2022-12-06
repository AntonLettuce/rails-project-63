# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < TestCase
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new(name: 'Anton', job: 'Frontend Developer')
  end

  def test_form_for_without_url
    result = HexletCode.form_for @user
    assert_equal '<form action="#" method="post"></form>', result
  end

  def test_form_for_with_url
    result = HexletCode.form_for @user, url: '/users'
    assert_equal '<form action="/users" method="post"></form>', result
  end

  def test_form_fields_default
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal load_fixture('default.html'), result
  end

  def test_form_fields_with_additional_attributes
    result = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal load_fixture('additional_attrs.html'), result
  end

  def test_reassign_attributes_of_form_fields
    result = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal load_fixture('reassign_default_attrs.html'), result
  end

  def test_for_non_existable_user_prop
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end

  def test_form_with_default_button
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal load_fixture('form_with_default_button.html'), result
  end

  def test_form_with_custom_button
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal load_fixture('form_with_custom_button.html'), result
  end
end
