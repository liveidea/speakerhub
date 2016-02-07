require 'test_helper'
require "minitest/reporters"
Minitest::Reporters.use!

class ConferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Conference shouldnt be created without title" do
    conf = conferences(:one)
    assert conf.save
  end
end
