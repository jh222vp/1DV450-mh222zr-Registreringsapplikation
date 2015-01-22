require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have an email adress" do
    u = User.new
    u.password = "testing123"
    assert_not u.save
  end

  test "should have a valid email adress" do
    u = User.new
    u.email = "useremail.com"
    u.password = "testing123"
    assert_not u.save
  end

  test "should have a password" do
    u = User.new
    u.email = "user@example.com"
    assert_not u.save
  end

  test "should have a safe password" do
    u = User.new
    u.email = "user@example.com"
    u.password = "1234"
    assert_not u.save
  end

  test "should not allow multiple registrations for one email" do
    u = User.new
    u.email = "user@example.com"
    u.password = "testing123"
    u.save

    u2 = User.new
    u2.email = "user@example.com"
    u2.password = "123testing"
    assert_not u2.save
  end
end
