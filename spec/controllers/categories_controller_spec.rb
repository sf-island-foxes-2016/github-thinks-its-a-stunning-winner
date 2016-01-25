require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  describe "#show" do
    before do
      @category = Category.create( id: 1,  name: "Notebook")
    end

    it 'should load category' do
      get :show, {"id"=>"1"}
      expect(assigns[:category]).to eq Category.find_by(name: "Notebook")
      expect(response.status).to eq 200
      expect(response).to have_rendered(:show)
    end
  end
end
