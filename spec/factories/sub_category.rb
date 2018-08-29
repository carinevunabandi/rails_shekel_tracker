FactoryBot.define do
  factory :sub_category do
    name  Faker::Name.name
    main_category
  end
end
