require "rails_helper"

describe CategoriesFacade do
  let!(:transport_category) { create(:main_category, name: "Transportation") }
  let!(:children_category)  { create(:main_category, name: "Children") }
  subject { described_class.new }

  before do
    create(:sub_category, name: "Fuel", main_category: transport_category)
    create(:sub_category, name: "Parking", main_category: transport_category)
    create(:sub_category, name: "Toys", main_category: children_category)
    create(:sub_category, name: "Clothes", main_category: children_category)
  end

  describe "all_main_cats_and_subs_in_hash" do
    it "loads all main categories" do
      expect(MainCategory).to receive(:all)
      subject.all_main_cats_and_subs_in_hash
    end

    it "creates a hash of all the main categories as keys and the list of their sub_categories as values" do
      result = {"Transportation" => %w[Fuel Parking], "Children" => %w[Toys Clothes]}
      expect(subject.all_main_cats_and_subs_in_hash).to eq result
    end
  end

  describe "all_main_cats_and_subs_in_arrays" do
    it "calls all_main_cats_and_subs_in_hash" do
      expect(MainCategory).to receive(:all)
      subject.all_main_cats_and_subs_in_arrays
    end

    it "creates an array of hashes of main categories as keys and the list of their sub_categories as values" do
      result = [["Transportation", %w[Fuel Parking]], ["Children", %w[Toys Clothes]]]
      expect(subject.all_main_cats_and_subs_in_arrays).to eq result
    end
  end
end
