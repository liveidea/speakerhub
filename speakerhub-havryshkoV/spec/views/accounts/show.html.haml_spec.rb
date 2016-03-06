require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!( f_name:           "Vova",
										   													 l_name:           "Gula",
																							   phone:      	     "097-11-11-111" ,  
																							   facebook_account: "freevova",  
																							   skype_account:    "freevova",
																							   user: create(:user) ))
  end

  # it "renders attributes in <p>" do
  #   render
  # end
end
