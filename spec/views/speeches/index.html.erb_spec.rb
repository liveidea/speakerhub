require 'rails_helper'

RSpec.describe "speeches/index", type: :view do
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

    assign(:speeches, Kaminari.paginate_array([ speech1, speech2]).page(1))

  end

  it "renders a list of speeches" do
    render
  end
end
