require "rails_helper"

RSpec.describe User, :type => :model do

  # it "validates the name and makes sure it isn't empty" do
  # 	user = build(:user, f_name: "")
  # 	user.valid?
  # 	expect(user.errors[:f_name]).not_to be_empty
  # end

  it "calculates total count of users speeches" do
    speech1 = create(:speech)
  	speech2 = create(:speech)

  	user1 = create(:user)
    user1.speeches << speech1
    user1.speeches << speech2

  	
  	expect(user1.total_speeches).to eq 2
  end

  it "validates email and makes sure it is not wrong" do
    user = build(:user, email: "text")
    expect(user.valid?).to be false
  end

  it "validates emails and makes sure it is unique" do
    user1 = create(:user)
    user2 = build(:user)
    user2.email = user1.email
    user2.save
    expect(user2.valid?).to be false
  end

  it "shows user-city assosiation works well" do
    user = build(:user)
    user.city = build(:city, name: "Berlin")
    expect(user.city.name).to eq "Berlin"
  end

  it "create account after user saving" do
    user = create(:user)
    expect(user.account_id).not_to be_nil  
  end

  it "should rewrite user f_name to account f_name" do
    user = create(:user)
    expect(user.f_name).to eq user.account.f_name
  end

end