require 'rails_helper'

RSpec.describe "speeches/edit", type: :view do
  before(:each) do
    @speech = assign(:speech, Speech.create!())
  end

  it "renders the edit speech form" do
    render

    assert_select "form[action=?][method=?]", speech_path(@speech), "post" do
    end
  end
end
