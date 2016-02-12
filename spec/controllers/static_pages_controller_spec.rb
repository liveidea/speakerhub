require 'rails_helper'
require 'capybara/rails'
#include RSpecHtmlMatchers

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
      expect(page).to have_tag('h1')
      
      #response.should have_tag('h1')
      #expect(rendered).to have_tag('h1')
      #expect(page).to have_css('title', :text => 'Home | Speakerhub')
      #assert_select "title", "Home | Speakerhub"
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
      #assert_select "title", "Help | Speakerhub"
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
      #assert_select "title", "About | Speakerhub"
    end
  end

end
