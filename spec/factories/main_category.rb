FactoryBot.define do
  factory :main_category do
    name  { ["ATM Cash withdrawal", "Children", "Clothing or Shoes or Attire", "Debt Repayment",
             "Education", "Financial Services Costs and Charges", "Food and Drinks", "Gifts and Donations",
             "Health and Wellbeing", "Holiday and Associated Costs", "Household", "Insurance",
             "Leisure and Hobbies", "Money loss by accident", "Obligations", "Personal Care",
             "Savings", "Special Events", "Transportation", "Unclear", "Utilities", "Voucher Purchase"].sample }
  end
end

