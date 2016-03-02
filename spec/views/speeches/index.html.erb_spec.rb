require 'rails_helper'

RSpec.describe "speeches/index", type: :view do
  # before(:each) do
  #   assign(:speeches, [
  #     Speech.create!( title:       "Automation in real life",
  #                     description: "Some text",
  #                     place:       "Lviv",
  #                     date:        Time.now ),
  #     Speech.create!( title:       "Automation in real life",
  #                     description: "Some text",
  #                     place:       "Lviv",
  #                     date:        Time.now )
  #   ])
  # end
  before(:each) do
    speech1 = Speech.create!( title:       "Automation in real life",
                      description: "Some text",
                      place:       "Lviv",
                      date:        Time.now )
    speech1.user = create(:user)
    speech1.user.account = create(:account)

    speech2 = Speech.create!( title:       "Automation in real life",
                      description: "Some text",
                      place:       "Lviv",
                      date:        Time.now )
    speech2.user = create(:user)
    speech2.user.account = create(:account)


    assign(:speeches, [ speech1, speech2])
    #assign(:speeches, [ speech1, speech2]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of speeches" do
    #allow(view).to receive_messages(:will_paginate => nil) # Add this

    render
  end
end
