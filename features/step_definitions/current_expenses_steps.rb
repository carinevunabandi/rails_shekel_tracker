When "I view the current expenses list" do
  @current_expenses_page = CurrentExpensesPage.new
  @current_expenses_page.load
end

Given "there are expenses for the current time period" do
end
