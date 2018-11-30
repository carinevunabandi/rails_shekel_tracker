class CategoriesController < ApplicationController
  def index
    @categories_list = CategoriesFacade.new.all_main_cats_and_subs_in_arrays
  end
end
