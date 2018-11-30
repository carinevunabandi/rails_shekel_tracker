FactoryBot.define do
  factory :sub_category do
    name  do Faker::Name.name end
    main_category
  end
end
