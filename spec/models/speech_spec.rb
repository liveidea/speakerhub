 require "rails_helper"

RSpec.describe Speech, :type => :model do

  it "should not be saving without date" do
  	speech = build(:speech, date: nil)
  	speech.valid?
  	expect(speech.errors[:date]).not_to be_empty
  end
end 