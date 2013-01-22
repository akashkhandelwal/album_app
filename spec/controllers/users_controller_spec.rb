require 'spec_helper'

describe UsersController do

  describe "GET #index" do
    it "populates an array of users" do
      user = FactoryGirl.create(:user)
      get :index
      assigns(:users).should eq([user])
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      assigns(:user).should eq(user)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:user)
      response.should render_template :show
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User,:count).by(1)
      end
      
      it "redirects to the new user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to User.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
        }.to_not change(User,:count)
      end
      
      it "re-renders the new method" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        response.should render_template :new
      end
    end 
  end

  describe 'PUT update' do
    before :each do
      @user = FactoryGirl.create(:user,name: "Akash")
    end
    
    context "valid attributes" do
      it "located the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        assigns(:user).should eq(@user)      
      end
    
      it "changes @user's attributes" do
        put :update, id: @user, 
          user: FactoryGirl.attributes_for(:user, name: "Rahul")
        @user.reload
        @user.name.should eq("Rahul")
      end
    
      it "redirects to the updated user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to @user
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        assigns(:user).should eq(@user)      
      end
      
      it "does not change @user's attributes" do
        put :update, id: @user, 
          user: FactoryGirl.attributes_for(:user, name: nil)
        @user.reload
        @user.name.should_not eq(nil)
      end
      
      it "re-renders the edit method" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    
    it "deletes the user" do
      expect{
        delete :destroy, id: @user        
      }.to change(User,:count).by(-1)
    end
      
    it "redirects to users#index" do
      delete :destroy, id: @user
      response.should redirect_to users_url
    end
  end
end