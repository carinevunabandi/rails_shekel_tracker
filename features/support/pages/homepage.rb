class Homepage < SitePrism::Page
  set_url '/'

  element :past_months_link, :link, 'Past Months'
  element :current_month_link, :link, 'Current Month'

  def view_current
    current_month_link.click
    CurrentBudgetPage.new
  end

  def view_past
    past_months_link.click
    PastBudgetsPage.new
  end
end
