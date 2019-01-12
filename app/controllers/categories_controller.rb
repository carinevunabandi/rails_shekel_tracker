class CategoriesController < ApplicationController
  def index
    @categories_list = CategoriesFacade.new.all_main_cats_and_subs_in_arrays
  end

  def new
    @main_category = MainCategory.new
  end

  def create
    params = main_category_params
    @main_category = MainCategory.create(name: params["name"])
    @main_category.save ? creation_success : creation_failure
    create_sub_categories_using params if sub_categories_submitted? params
    redirect_to categories_path 
  end

  private

  def main_category_params
    params.require(:main_category).permit([:name, :description, :sub_categories => []]).to_h
  end

  def sub_categories_submitted? params
    params[:sub_categories].nil? ? false : true
  end

  def create_sub_categories_using params
    @sub_categories = []
    params[:sub_categories].each do |sub_category|
      @sub_categories << SubCategory.create(name: sub_category, main_category: @main_category)
    end
  end

  def creation_success
    flash[:success] = "Category successfully created!"
  end

  def creation_failure
    flash[:error] = "Failed to create"
    flash[:error_msgs] =  @main_category.errors.messages.values.flatten.join(",")
  end
end
