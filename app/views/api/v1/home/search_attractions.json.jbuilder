json.success true
#Send all the areas data as a json in the response of API
json.attraction_areas @attraction_areas do |attraction_area|
  json.id attraction_area.id
  json.title attraction_area.title
  json.country attraction_area.country
  json.area_site attraction_area.area_site
  json.thumbnail_img_url root_url + attraction_area.thumbnail_img_url
end

#Send all selected area site as a json in the response of API
json.name @area_site
json.country @country