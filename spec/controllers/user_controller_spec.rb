require 'spec_helper'

require 'rails_helper'
RSpec.describe UserController, type: :controller do

  describe UserController do
    let(:admin) { FactoryGirl.create :admin }
    let(:attributes_admin) { FactoryGirl.attributes_for :admin}
    let(:user) { FactoryGirl.create :user}
    let(:attributes_user) { FactoryGirl.attributes_for :user}

    describe "GET #index" do
      before(:each) do
        session[:user_id] = user.id
        get :index
      end
      it "responds with a 200" do
        expect(response.status).to eq(200)
      end
      it "assigns the users instance variable" do
        expect(assigns(:users)).to be_a(ActiveRecord::Relation)
      end
    end

    describe 'POST #create' do
      it "saves a new user in the database" do
        expect{
          post :create, :user => attributes}.to change{ User.count}.by(1)
        end

        it "redirects to the root path" do
          post :create, :user => attributes
          expect(response.status).to eq(302)
        end
      end

      # describe 'GET #show' do
      #   before(:each) do
      #     get :show, id: user.idbe rspec
      #   end

      #   it "assigns the user instance variable" do
      #     expect(assigns[:user]).to be_a(User)
      #   end
      # end

      describe 'PUT #update' do
        let!(:username) { "UPDATED_USERNAME" }
        it 'updates a field on an user' do
          put :update, id: user.id, user: { username: username}
          expect(user.reload.username).to eq(user.username)
        end
      end

      describe 'DELETE #destroy' do
      before(:each) do
        session[:user_id] = admin.id
      end
        it 'decrements users by one' do
          user_id = user.id
          expect {
            delete :destroy, id: user_id
            }.to change{ User.count }.by(-1)
          end
          it 'redirects to the root path' do
            user_id = user.id
            delete :destroy, id: user_id
            expect(response.status).to eq(302)
          end
        end

      end
    end


