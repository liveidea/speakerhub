require 'rails_helper'
#require 'spec_helper'
#include RSpecHtmlMatchers

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
      # visit '/'
      # expect(page).to have_tag("h2")
      
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
