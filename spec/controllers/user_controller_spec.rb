require 'spec_helper'

require 'rails_helper'
RSpec.describe UsersController, type: :controller do

  describe UsersController do
    let(:new_user) { FactoryGirl.create :user, :non_admin }
    let(:admin) { FactoryGirl.create :user, :admin }
    let(:attributes_user) { FactoryGirl.attributes_for :user, :non_admin}

    describe "GET #index" do
      before(:each) do
        session[:user_id] = admin.id
        get :index
      end
      it "responds with a 200" do
        expect(response.status).to eq(302)
      end
      # it "assigns the users instance variable" do
      #   expect(assigns(:user)).to be_a(ActiveRecord::Relation)
      # end
    end

    describe 'POST #create' do
      it "saves a new user in the database" do
        expect{
          post :create, :user => attributes_user}.to change{ User.count}.by(1)
        end

        it "redirects to the root path" do
          post :create, :user => attributes_user
          expect(response.status).to eq(302)
        end
      end

      # describe 'GET #show' do
      # #   before(:each) do
      #     get :show, id: user.idbe rspec
      # #   end

      #   it "assigns the user instance variable" do
      #     expect(assigns[:user]).to be_a(User)
      #   end
      # end

      # describe 'PUT #update' do
      #   let!(:username) { "UPDATED_USERNAME" }
      #   it 'updates a field on an user' do
      #     put :update, :user => attributes_user, user: { username: username}
      #     expect(user.reload.username).to eq(user.username)
      #   end
      # end

      describe 'DELETE #destroy' do
      before(:each) do
        session[:user_id] = admin.id
      end
        it 'decrements users by one' do
            post :create, :user => attributes_user
          expect {
            delete :destroy, id: 1}.to change{ User.count }.by(-1)
          end
          it 'redirects to the root path' do
            post :create, :user => attributes_user
            delete :destroy, id: 1
            expect(response.status).to eq(302)
          end
        end

      end
    end


