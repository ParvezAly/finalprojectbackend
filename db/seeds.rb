# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.times do |i|
 Country.create(
    title: "Pakistan"
  )
 Country.create(
    title: "UAE"
  )
end

1.times do |i|
 AttractionArea.create(
     title: "Hunza",
     country_id: Country.first.id,
     area_site: "Northern Areas",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
 AttractionArea.create(
     title: "Chitral",
     country_id: Country.first.id,
     area_site: "Northern Areas",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
 AttractionArea.create(
     title: "Naran",
     country_id: Country.first.id,
     area_site: "Northern Areas",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
 AttractionArea.create(
     title: "Mansera",
     country_id: Country.first.id,
     area_site: "Northern Areas",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
 AttractionArea.create(
     title: "Islamabad",
     country_id: Country.first.id,
     area_site: "Northern Areas",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
 AttractionArea.create(
     title: "Khunjrab Pass",
     country_id: Country.first.id,
     area_site: "Northern Areas",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
AttractionArea.create(
    title: "DI Khan",
    country_id: Country.first.id,
    area_site: "Southern Areas",
    thumbnail_img_url: "attraction_areas/hunza.png"
)
AttractionArea.create(
    title: "DG Khan",
    country_id: Country.first.id,
    area_site: "Southern Areas",
    thumbnail_img_url: "attraction_areas/hunza.png"
)
AttractionArea.create(
    title: "Khanpur",
    country_id: Country.first.id,
    area_site: "Southern Areas",
    thumbnail_img_url: "attraction_areas/hunza.png"
)
AttractionArea.create(
    title: "BWP",
    country_id: Country.first.id,
    area_site: "Southern Areas",
    thumbnail_img_url: "attraction_areas/hunza.png"
)
AttractionArea.create(
    title: "Wehari",
    country_id: Country.first.id,
    area_site: "Southern Areas",
    thumbnail_img_url: "attraction_areas/hunza.png"
)
AttractionArea.create(
    title: "Multan",
    country_id: Country.first.id,
    area_site: "Southern Areas",
    thumbnail_img_url: "attraction_areas/hunza.png"
)

 AttractionArea.create(
     title: "Dubai",
     country_id: Country.last.id,
     area_site: "Beach",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
 AttractionArea.create(
     title: "Abu Dhabi",
     country_id: Country.last.id,
     area_site: "Stadium",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
 AttractionArea.create(
     title: "Jazan",
     country_id: Country.last.id,
     area_site: "Beach",
     thumbnail_img_url: "attraction_areas/hunza.png"
 )
end

1.times do |i|
 Hotel.create(
     name: "Hunza Serena",
     video_url: "https://www.youtube.com/watch?v=__gs2y41OOc",
     adult_price: 250,
     child_price: 125,
     attraction_area_id: AttractionArea.first.id
 )
 Hotel.create(
     name: "Hunza Embassy",
     video_url: "https://www.youtube.com/watch?v=w5XrxSNME3k",
     adult_price: 220,
     child_price: 110,
     attraction_area_id: AttractionArea.first.id
 )
 Hotel.create(
     name: "Hotel Darbar",
     video_url: "https://www.youtube.com/watch?v=D5MtRqvnP30",
     adult_price: 220,
     child_price: 110,
     attraction_area_id: AttractionArea.first.id
 )
 Hotel.create(
     name: "PTDC Motel",
     video_url: "https://www.youtube.com/watch?v=BEnOGH091OA",
     adult_price: 210,
     child_price: 105,
     attraction_area_id: AttractionArea.first.id
 )
 Hotel.create(
     name: "Eagle's Nest",
     video_url: "https://www.youtube.com/watch?v=XzlFobmDSks",
     adult_price: 200,
     child_price: 100,
     attraction_area_id: AttractionArea.first.id
 )
 Hotel.create(
     name: "Hunza View",
     video_url: "https://www.youtube.com/watch?v=m8ksDeU0IsE",
     adult_price: 200,
     child_price: 100,
     attraction_area_id: AttractionArea.first.id
 )
end