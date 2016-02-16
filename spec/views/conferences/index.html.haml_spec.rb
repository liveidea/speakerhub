require 'rails_helper'

RSpec.describe "conferences/index", type: :view do
  before(:each) do
    assign(:conferences, [
      Conference.create!(),
      Conference.create!()
    ])
  end

  it "renders a list of conferences" do
    render
  end
end
