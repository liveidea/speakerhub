require 'test_helper'

class SpeachTest < ActiveSupport::TestCase
  test "it shouldn't save speech without date" do
	speech = speeches(:one)
  	assert speech.save
  end
end