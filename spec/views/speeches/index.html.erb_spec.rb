require 'rails_helper'

RSpec.describe "speeches/index", type: :view do
  before(:each) do
    assign(:speeches, [
      Speech.create!( title:       "Automation in real life",
                      description: "Some text",
    									place:       "Lviv",
    									date:        Time.now ),
      Speech.create!( title:       "Automation in real life",
                      description: "Some text",
    									place:       "Lviv",
    									date:        Time.now )
    ])
  end

  it "renders a list of speeches" do
    render
  end
end
