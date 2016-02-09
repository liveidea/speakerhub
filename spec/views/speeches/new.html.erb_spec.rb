require 'rails_helper'

RSpec.describe "speeches/new", type: :view do
  before(:each) do
    assign(:speech, Speech.new())
  end

  it "renders new speech form" do
    render

    assert_select "form[action=?][method=?]", speeches_path, "post" do
    end
  end
end
