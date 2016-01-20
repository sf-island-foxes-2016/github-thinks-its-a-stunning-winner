require 'rails_helper'

RSpec.describe Category do
  context 'new Category' do
    it 'is valid with a name' do
      category = Category.new(name:"Stationery")
      category.valid?
    end

    it 'is invalid without a unique name' do
      category = Category.create(name: "Stationery")
      category2 = Category.new(name:"Stationery")
      expect(category2.valid?).to be false
    end
  end
end
