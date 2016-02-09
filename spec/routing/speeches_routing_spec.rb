require "rails_helper"

RSpec.describe SpeechesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/speeches").to route_to("speeches#index")
    end

    it "routes to #new" do
      expect(:get => "/speeches/new").to route_to("speeches#new")
    end

    it "routes to #show" do
      expect(:get => "/speeches/1").to route_to("speeches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/speeches/1/edit").to route_to("speeches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/speeches").to route_to("speeches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/speeches/1").to route_to("speeches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/speeches/1").to route_to("speeches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/speeches/1").to route_to("speeches#destroy", :id => "1")
    end

  end
end
