require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not be able to save without required fields" do
    user = User.new
    assert_not user.save
  end

  test "should save a user with all attributes" do
    user = User.new
    user.email = "test@email.com"
    user.password = "secret123"
    user.first_name = "Nik"
    user.last_name = "Novak"
    assert user.save
  end
end
