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

    it "renders the index template" do
      expect(get :index).to render_template(:index)
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    let(:main_category_object) { double :main_category }

    before do
      allow(MainCategory).to receive(:new).and_return(main_category_object)
    end

    it "instantiates a category object" do
      get :new
      expect(assigns(:main_category)).to eq main_category_object
    end

    it "renders the new category template" do
      expect(get :new).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "Creating a new category" do
      let(:main_category_attrs)  { attributes_for :main_category }
      let(:main_category)        { double(:main_category, id: 1) }

      before do
        allow(MainCategory).to receive(:create).and_return(main_category)
        allow(main_category).to receive(:save).and_return true
      end

      it "creates a new category" do
        expect(MainCategory).to receive(:create).with(main_category_attrs).and_return(main_category)
        post :create, params: {main_category: main_category_attrs }
      end

      context "Creating a category with sub-categories" do
        it "creates a new category with its sub-categories" do
          main_category_attrs = {:name=>"Personal Care", description: "some description", sub_categories:["Tissues", "Shower Gels", "Lotions"]}
          expect(MainCategory).to receive(:create).with(name: "Personal Care", description: "some description").and_return(main_category)
          expect(SubCategory).to receive(:create).with(name: "Tissues", main_category: main_category)
          expect(SubCategory).to receive(:create).with(name: "Shower Gels", main_category: main_category)
          expect(SubCategory).to receive(:create).with(name: "Lotions", main_category: main_category)
          post :create, params: { main_category: main_category_attrs }
        end
      end

      context "Upon successful creation of a category" do
        before do
          post :create, params: {main_category: main_category_attrs }
        end

        it { should set_flash[:success] }
        it { should redirect_to categories_path }
      end
    end

    context "Creating a new category whose name is the same as an existing one" do
      before do
        create(:main_category, name: "Transportation")
        new_cat_attributes = attributes_for(:main_category, name: "Transportation")
        new_main_category = build(:main_category, name: "Transportation")
        allow(MainCategory).to receive(:create).with(new_cat_attributes).and_return(new_main_category)
        allow(new_main_category).to receive(:save).and_return(false)
        post :create, params: {main_category: new_cat_attributes }
      end

      it "doesn't create a category that already exists in the database" do
        expect(MainCategory.where(name: "Transportation").count).to eq 1
      end

      it { should set_flash[:error] }
    end
  end
end
