Given "there are main categories with sub-categories" do
  transport_category = FactoryBot.create(:main_category, name: "Transportation")
  debt_repayment_category = FactoryBot.create(:main_category, name: "Debt Repayment")
  FactoryBot.create(:sub_category, name: "Fuel", main_category: transport_category)
  FactoryBot.create(:sub_category, name: "Vehicle Payment", main_category: transport_category)
  FactoryBot.create(:sub_category, name: "Credit Payment", main_category: debt_repayment_category)
  FactoryBot.create(:sub_category, name: "Loan Payment", main_category: debt_repayment_category)
end

When "I visit the categories page" do
  @categories_page = CategoriesPage.new
  @categories_page.load
end

Then "I see the list of all categories" do
  expect(@categories_page).to have_content "Transportation"
  expect(@categories_page).to have_content "Debt Repayment"
end

And "I see the list of all sub-categories for each main category" do
  expect(@categories_page).to have_content "Fuel"
  expect(@categories_page).to have_content "Vehicle Payment"
  expect(@categories_page).to have_content "Credit Payment"
  expect(@categories_page).to have_content "Loan Payment"
end

When "I click the create new category button" do
  @categories_page.create_new_button.click
end

And "I enter in the name and the description of the new category" do
  @categories_page.type_in_category("Latest Category")
  @categories_page.type_in_description("Latest Category Description")
end

And "I enter in the name of any sub-categories for the new category" do
    @categories_page.type_in_sub_categories(["Latest sub-category 1",
                                             "Latest sub-category 2",
                                             "Latest sub-category 3"])
end

And "I click save" do
    @categories_page.save_new.click
end

Then "the new category and any sub-categories should be created" do
  expect(MainCategory.find_by(name: "Latest Category")).not_to be_nil
  expect(SubCategory.find_by(name: "Latest sub-category 1")).not_to be_nil
  expect(SubCategory.find_by(name: "Latest sub-category 2")).not_to be_nil
  expect(SubCategory.find_by(name: "Latest sub-category 3")).not_to be_nil
end
