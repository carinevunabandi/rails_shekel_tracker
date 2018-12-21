require 'byebug'

FactoryBot.define do
  factory :main_category do
    name  {
      ["ATM Cash withdrawal", "Children", "Clothing or Shoes or Attire", "Debt Repayment",
       "Education", "Financial Services Costs and Charges", "Food and Drinks", "Gifts and Donations",
       "Health and Wellbeing", "Holiday and Associated Costs", "Household", "Insurance",
       "Leisure and Hobbies", "Money loss by accident", "Obligations", "Personal Care",
       "Savings", "Special Events", "Transportation", "Unclear", "Utilities", "Voucher Purchase"].sample
    }

    factory :main_category_with_sub_categories do
      transient do
        sub_categories_count { 3 }
      end

      # debugger
      after(:create) do |main_category, evaluator|
        create_list(:sub_category, evaluator.sub_categories_count, main_category: main_category)
      end
    end
  end
end
