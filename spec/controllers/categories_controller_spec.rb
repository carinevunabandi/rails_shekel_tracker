require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    let(:categories_facade_array)    { double(:categories_facade_array) }
    let(:main_cats_and_subs)         { double(:main_cats_and_subs) }

    before do
      allow(CategoriesFacade).to receive(:new).and_return(categories_facade_array)
      allow(categories_facade_array).to receive(:all_main_cats_and_subs_in_arrays).and_return(main_cats_and_subs)
    end

    it "loads all the categories and their sub-categories" do
      expect(categories_facade_array).to receive(:all_main_cats_and_subs_in_arrays)
      get :index
    end

    it "loads all the categories and their sub-categories" do
      get :index
      expect(assigns(:categories_list)).to eq main_cats_and_subs
    end

    it "renders template" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "Creating a category with no description" do
      it "creates a new category which has no description" do
      end
    end

    context "Creating a category without sub-categories" do
      it "creates a new category which has no sub-categories" do
      end
    end

    context "Creating a category with sub-categories" do
      it "creates a new category with its sub-categories" do
      end
    end

    context "Creating a category with sub-categories with empty fields" do
      it "creates a new category ignoring any empty sub-categories text-fields" do
      end
    end
  end
end
