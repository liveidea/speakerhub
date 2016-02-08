require "rails_helper"

RSpec.describe User, :type => :model do

  it "should do something" do
  	expect(1 + 1).to eq 2
  end

  it "validates the name and makes sure it isn't empty" do
  	user = User.new(f_name: "")
  	user.valid?
  	expect(user.errors[:f_name]).not_to be_empty
  end

  # it "calculates total count of users speeches" do
  #   speech1 = FactoryGirl.create(:speech)
  #   expect(speech1.place).to eq "Lviv" 
  # end



  it "calculates total count of users speeches" do
    speech1 = create(:speech)
  	speech2 = FactoryGirl.create(:speech)

  	user1 = FactoryGirl.create(:user)
    user1.speeches << speech1
    user1.speeches << speech2

  	
  	expect(user1.total_speeches).to eq 2
  end






end