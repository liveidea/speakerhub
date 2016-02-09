require "rails_helper"

RSpec.describe Conference, :type => :model do

  it "should not be created without title" do
  	conference1 = build(:conference, title: nil)
  	conference1.valid?
  	expect(conference1.errors[:title]).not_to be_empty 
  end
  
end