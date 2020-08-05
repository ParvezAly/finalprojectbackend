json.success true
#Send all the countries data as a json in the response of API
json.countries @countries do |country|
  json.id country.id
  json.title country.title
end
#Send the selected country as a json in the response of API
json.country @country

#Send the selected area site as a json in the response of API
json.area_site @area_site

#Send all the areas data as a json in the response of API
json.attraction_areas @attraction_areas do |attraction_area|
  json.id attraction_area.id
  json.title attraction_area.title
  json.area_site attraction_area.area_site
  json.thumbnail_img_url root_url + attraction_area.thumbnail_img_url
end

#send All the Areas site for the search on the front site in API Response
json.area_sites @area_sites do |area_site|
  json.name area_site.area_site
end