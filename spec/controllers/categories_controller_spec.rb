require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  describe "#show" do
    before do
      @product = Product.create( id: 1,  name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1)
    end

    it 'should load product' do
      get :show, {"id"=>"1"}
      expect(assigns[:product]).to eq Product.find_by(name: "Notebook")
      expect(response.status).to eq 200
      expect(response).to have_rendered(:show)
    end
  end
end
