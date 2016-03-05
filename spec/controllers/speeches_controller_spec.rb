require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SpeechesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Speech. As you add validations to Speech, be sure to
  # adjust the attributes here as well.
  def valid_session
    controller.stub!(:signed_in?).and_return(true)
  end

  let(:valid_attributes) {
    {title: "Automation in real life", description: "Some text", place: "Lviv", date: Time.now}
  }

  let(:invalid_attributes) {
    {title: nil, description: "Some text", place: "Lviv", date: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ConferencesController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "show action" do
    it "renders show template if an item is found" do
      speech = create(:speech)
      get :show, { id: speech.id }
      expect(response).to render_template('show')
    end

  end

  describe "create action" do
    it "redirects to showing speech page if validation pass" do
      post :create, speech: { title: "Automation", date: Time.now }
      expect(response.content_type).to eq "text/html"
      # expect(response).to redirect_to(assigns(:speech))
    end

    it "renders again new application if validation fail" do
      post :create, speech: { title: "Automation", date: nil }
      expect(response).to render_template('new')
    end
  end

  describe "destroy action" do
    it "redirects to showing speech page if validation pass" do
      speech = create(:speech)
      delete :destroy, id: speech.id
      expect(response).to redirect_to(root_url)
    end
  end


  describe "GET #index" do
    it "assigns all speeches as @speeches" do
      speech = Speech.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:speeches)).to eq([speech])
    end
  end

  describe "GET #show" do
    it "assigns the requested speech as @speech" do
      speech = Speech.create! valid_attributes
      get :show, {:id => speech.to_param}, valid_session
      expect(assigns(:speech)).to eq(speech)
    end
  end

  describe "GET #new" do
    it "assigns a new speech as @speech" do
      get :new, {}, valid_session
      expect(assigns(:speech)).to be_a_new(Speech)
    end
  end

  describe "GET #edit" do
    it "assigns the requested speech as @speech" do
      speech = Speech.create! valid_attributes
      get :edit, {:id => speech.to_param}, valid_session
      expect(assigns(:speech)).to eq(speech)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Speech" do
        expect {
          post :create, {:speech => valid_attributes}, valid_session
        }.to change(Speech, :count).by(1)
      end

      it "assigns a newly created speech as @speech" do
        post :create, {:speech => valid_attributes}, valid_session
        expect(assigns(:speech)).to be_a(Speech)
        expect(assigns(:speech)).to be_persisted
      end

      it "redirects to the created speech" do
        post :create, {:speech => valid_attributes}, valid_session
        expect(response).to redirect_to(Speech.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved speech as @speech" do
        post :create, {:speech => invalid_attributes}, valid_session
        expect(assigns(:speech)).to be_a_new(Speech)
      end

      it "re-renders the 'new' template" do
        post :create, {:speech => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested speech" do
        speech = Speech.create! valid_attributes
        put :update, {:id => speech.to_param, :speech => new_attributes}, valid_session
        speech.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested speech as @speech" do
        speech = Speech.create! valid_attributes
        put :update, {:id => speech.to_param, :speech => valid_attributes}, valid_session
        expect(assigns(:speech)).to eq(speech)
      end

      it "redirects to the speech" do
        speech = Speech.create! valid_attributes
        put :update, {:id => speech.to_param, :speech => valid_attributes}, valid_session
        expect(response).to redirect_to(speech)
      end
    end

    context "with invalid params" do
      it "assigns the speech as @speech" do
        speech = Speech.create! valid_attributes
        put :update, {:id => speech.to_param, :speech => invalid_attributes}, valid_session
        expect(assigns(:speech)).to eq(speech)
      end

      it "re-renders the 'edit' template" do
        speech = Speech.create! valid_attributes
        put :update, {:id => speech.to_param, :speech => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested speech" do
      speech = Speech.create! valid_attributes
      expect {
        delete :destroy, {:id => speech.to_param}, valid_session
      }.to change(Speech, :count).by(-1)
    end

    it "redirects to the speeches list" do
      speech = Speech.create! valid_attributes
      delete :destroy, {:id => speech.to_param}, valid_session
      expect(response).to redirect_to(speeches_url)
    end
  end

end
