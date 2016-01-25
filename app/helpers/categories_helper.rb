module CategoriesHelper

  def all_categories
    @categories = Category.all
  end

  def displayed_categories
    @categories = Category.all
    @categories = Category.find(params[:category_id]) if params[:category_id]
  end

  def new_category
    @category = Category.new
  end

  def create_category
    @category = Category.new(category_params)
    @category.save
  end

  def find_category
    @category = Category.find(category_params[:id])
  end

  def update_category
    @category.update(category_params)
  end

  def delete_category
    find_category
    @category.destroy
  end

  private

    def category_params
      params.permit(:name, :id)
    end

end
