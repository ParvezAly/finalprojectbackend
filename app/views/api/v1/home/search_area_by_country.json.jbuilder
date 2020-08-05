#send All the Areas site on the basis of country for the search on the front site in API Response
json.area_sites @area_sites do |area_site|
  json.name area_site.area_site
end