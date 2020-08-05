FactoryBot.define do
  factory :attraction_area do
    title { Faker::Name.name }
    area_site { Faker::Name.unique.name }
    #area_site { ["Northern Areas", "Punjab", "New York", "Bangla"][rand(0..3)] }
    thumbnail_img_url { Faker::File.file_name(:dir => 'foo/bar', :ext => 'png') }
    created_at { Faker::Date.between(:from => 10.days.ago, :to => Date.today) }
    #association :country
    #association :hotel
    
    transient do
      hotels_count { 5 }
    end

    after(:create) do |attraction_area, evaluator|
      create_list(:hotel, evaluator.hotels_count, :attraction_area => attraction_area)
      attraction_area.reload
    end

  end
end