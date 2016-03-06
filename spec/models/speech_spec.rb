 require "rails_helper"

RSpec.describe Speech, :type => :model do
	let!(:speech_no_title) { build(:speech, title: nil) }
	let!(:speech_no_date) { build(:speech, date: nil) }

  it "should not be saving without title" do
  	speech_no_title.valid?
  	expect(speech_no_title.errors[:title]).not_to be_empty
  end
  
  it "should not be saving without date" do
  	speech_no_date.valid?
  	expect(speech_no_date.errors[:date]).not_to be_empty
  end  
end 