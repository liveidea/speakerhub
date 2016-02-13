 require "rails_helper"

RSpec.describe Speech, :type => :model do
	let!(:speech) { build(:speech, date: nil) }

  it "should not be saving without date" do
  	speech.valid?
  	expect(speech.errors[:date]).not_to be_empty
  end
end 