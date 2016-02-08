require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "User have speeches?" do
    u = users(:user1)
    assert u.speech?, "User dont have any speeches"
  end

  test "User email valid?" do
    u = users(:user1)
    #u.email = "jglksg"
    assert  u.valid?, "Email should be valid"
  end

  test "it should show users from Lviv" do
    users = User.where(city: cities(:one))
    assert users.count == 2
  end

  test "it shouldn't save equal emails" do
    user1 = users(:user1)
    user2 = users(:user2)
    user2.email = user1.email
    user2.save
    assert_not user2.valid?, "Emails shouldnt repeat"
  end

end
