require 'rails_helper'

RSpec.describe "Speeches", type: :request do
  describe "GET /speeches" do
    it "works! (now write some real specs)" do
      get speeches_path
      expect(response).to have_http_status(200)
    end
  end
end
