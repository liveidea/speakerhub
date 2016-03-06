require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!( f_name:           "Vova",
										   l_name:           "Gula",
										   phone:      	     "097-11-11-111" ,  
										   facebook_account: "freevova",  
										   skype_account:    "freevova" ),
      Account.create!( f_name:           "Vova",
										   l_name:           "Gula",
										   phone:      	     "097-11-11-111" ,  
										   facebook_account: "freevova",  
										   skype_account:    "freevova" )
    ])
  end

  # it "renders a list of accounts" do
  #   render
  # end
end
