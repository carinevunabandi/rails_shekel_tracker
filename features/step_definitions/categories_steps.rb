Given "there are main categories with sub-categories" do
  transport_category = FactoryBot.create(:main_category, name: "Transportation")
  debt_repayment_category = FactoryBot.create(:main_category, name: "Debt Repayment")
  FactoryBot.create(:sub_category, name: "Fuel", main_category: transport_category)
  FactoryBot.create(:sub_category, name: "Vehicle Payment", main_category: transport_category)
  FactoryBot.create(:sub_category, name: "Credit Payment", main_category: debt_repayment_category)
  FactoryBot.create(:sub_category, name: "Loan Payment", main_category: debt_repayment_category)
end

Given "there is a Groceries expense category in the database" do
  FactoryBot.create(:main_category, name: "Groceries")
end

When "I visit the categories page" do
  @categories_index_page = CategoriesPage.new
  @categories_index_page.load
end

Then "I see the list of all categories" do
  expect(@categories_index_page).to have_content "Transportation"
  expect(@categories_index_page).to have_content "Debt Repayment"
end

And "I see the list of all sub-categories for each main category" do
  expect(@categories_index_page).to have_content "Fuel"
  expect(@categories_index_page).to have_content "Vehicle Payment"
  expect(@categories_index_page).to have_content "Credit Payment"
  expect(@categories_index_page).to have_content "Loan Payment"
end

When "I click the create new category button" do
  @categories_index_page.create_new_button.click
  @new_category_page = NewCategoryPage.new
end

And "I enter Groceries as the name of the new category" do
  @new_category_page.type_in_category("Groceries")
end

And "I enter in the name and the description of the new category" do
  @new_category_page.type_in_category("Latest Category")
  @new_category_page.type_in_description("Latest Category Description")
end

And "I enter in the name of any sub-categories for the new category" do
  @new_category_page.type_in_sub_categories(["Latest sub-category 1",
                                           "Latest sub-category 2",
                                           "Latest sub-category 3"])
end

And "I click save" do
  @new_category_page.save_new.click
end

Then "the new category should be created" do
  expect(MainCategory.find_by(name: "Latest Category")).not_to be_nil
end

Then "no other duplicate category should be created" do
  expect(MainCategory.where(name: "Groceries").count).to eq 1
end

Then "the sub-categories should be created" do
  expect(SubCategory.find_by(name: "Latest sub-category 1")).not_to be_nil
  expect(SubCategory.find_by(name: "Latest sub-category 2")).not_to be_nil
  expect(SubCategory.find_by(name: "Latest sub-category 3")).not_to be_nil
end

Then "the category should be listed on the page" do
  expect(@categories_index_page).to have_content "Latest Category"
end

Then "all its sub-categories should be listed on the page" do
  expect(@categories_index_page).to have_content "Latest sub-category 1"
  expect(@categories_index_page).to have_content "Latest sub-category 2"
  expect(@categories_index_page).to have_content "Latest sub-category 3"
end

Then "I see a flash success message" do
  expect(@categories_index_page).to have_content "Category successfully created!"
end

Then "I see a flash error message" do
  expect(@categories_index_page).to have_content "Failed to create"
end
