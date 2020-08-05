FactoryBot.define do
  factory :hotel do
    name { Faker::Name.unique.name }
    video_url { Faker::File.file_name(:dir => 'foo/bar', :ext => 'mp4') }
    adult_price { Faker::Number.decimal }
    child_price { Faker::Number.decimal }
    #association :attraction_area#, :factory => :attraction_area, :area_site => Faker::Name.unique.name, :title => Faker::Name.unique.name
    created_at { Faker::Date.between(:from => 10.days.ago, :to => Date.today) }
  end
end