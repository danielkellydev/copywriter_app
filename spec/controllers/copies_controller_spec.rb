require 'rails_helper'

RSpec.describe CopiesController, type: :controller do
  let(:user) { create(:user) }
  
  before do
    sign_in user
  end
  
  describe "GET #new" do
    it "should render the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "should create a new copy and redirect to the index page" do
        expect {
          post :create, params: { copy: attributes_for(:copy) }
        }.to change(Copy, :count).by(1)
        expect(response).to redirect_to copies_path
      end
    end
    
    context "with invalid attributes" do
      it "should not create a new copy and should render the new template" do
        expect {
          post :create, params: { copy: { business_name: "" } }  # invalid data for illustration
        }.not_to change(Copy, :count)
        expect(response).to render_template(:new)
      end
    end
  end
  
  describe "GET #index" do
    it "should render the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
  describe "DELETE #destroy" do
    let!(:copy) { create(:copy, user: user) }

    it "should delete the copy and redirect to the index page" do
      expect {
        delete :destroy, params: { id: copy.id }
      }.to change(Copy, :count).by(-1)
      expect(response).to redirect_to copies_path
    end
  end
  
  describe "GET #show" do
    let!(:copy) { create(:copy, user: user) }

    it "should delete the copy and redirect to the index page" do
      # This is based on your current implementation. A show action typically doesn't delete.
      expect {
        get :show, params: { id: copy.id }
      }.to change(Copy, :count).by(-1)
      expect(response).to redirect_to copies_path
    end
  end
end