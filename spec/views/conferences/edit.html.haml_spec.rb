require 'rails_helper'

RSpec.describe "conferences/edit", type: :view do
  before(:each) do
    @conference = assign(:conference, Conference.create!())
  end

  it "renders the edit conference form" do
    render

    assert_select "form[action=?][method=?]", conference_path(@conference), "post" do
    end
  end
end
