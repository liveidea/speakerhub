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

  test "Emails shouldn't repeat" do
    user1 = users(:user1)
    user2 = users(:user2)
    user2.email = user1.email
    user2.save
    assert user2.valid?, "Emails shouldnt repeat"
  end

end
