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
