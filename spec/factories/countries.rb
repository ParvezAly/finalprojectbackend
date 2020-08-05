require "pp"
FactoryBot.define do
  factory :country do
    title { ['Pakistan', 'USA', 'China'][rand(0..3)] }
    #association :attraction_areas, :factory => :attraction_area
    factory :country_with_attraction_areas do
      transient do
        attraction_areas_count { 4 }
      end

      after(:create) do |country, evaluator|
        create_list(:attraction_area, evaluator.attraction_areas_count, :country => country)
        country.reload

      end

    end

  end
end