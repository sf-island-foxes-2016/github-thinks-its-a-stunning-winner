require 'rails_helper'

require 'rails_helper'
RSpec.describe ProductController, type: :controller do
  describe "index action" do

    before do
      @all_products = 3.times.map do |n|
        Product.create(name: "Dog #{n}", description: "ugly", price: 20.0, category_id: 1)
      end
    end

    it 'should load all products' do
      get :index
      expect(assigns[:products]).to eq @all_products
      expect(response.status).to eq 200
      expect(response).to have_rendered(:index)
    end
  end

  describe "#show" do
    before do
      @product = Product.create!(id: 1, name: "Dog", description: "ugly", price: 20.0, category_id: 1)
    end

    it 'should load product' do
      get :show, {"id"=>"1"}
      expect(assigns[:product]).to eq Product.find_by(name: "Dog")
      expect(response.status).to eq 200
      expect(response).to have_rendered(:show)
    end
  end

    describe "#new" do
      it 'should load form' do
      get :new
      expect(response.status).to eq 302
      # expect(response).to have_rendered(:new)
    end
  end

  describe "#edit" do
    before do
      @product = Product.create!(id: 10, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
    end

    it 'should load product to be edited' do
      get :edit, {"id"=>"10"}
      expect(assigns[:product]).to eq Product.find_by(name: "Dog")
      # expect(response.status).to eq 200
      # expect(response).to have_rendered(:edit)
    end
  end

  describe 'POST #create' do
    let(:attributes){ {name: "Alfred", description: "ugly", price: 20.0, category_id: 1}}
    it "provides correct response" do
      post :create, :product => attributes
      expect(response.status).to eq(302)
    end
  end

  describe 'PATCH #update' do
    before do
      @product = Product.create!(id: 10, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
    end
    # let(:name){ "Lord Alfred" }
    it "provides correct response" do
      patch :update, id: 10
      # expect(Product.reload.name).to eq(Product.title)
      expect(response.status).to eq(302)
    end
  end

  describe 'DELETE #destroy' do
    # it 'decrements products by one' do
    #   @product = Product.create!(id: 100, name: "Dog10", description: "ugly", price: 20.0, category_id: 1)
    #   expect {
    #     delete :destroy, id: 100
    #   }.to change{ Product.count }.by(-1)
    # end
    it 'redirects' do
      delete :destroy, id: 100
      expect(response.status).to eq(302)
    end
  end

end
