json.success true
#Send all the Hotel data as a json in the response of API
json.hotels @hotels do |hotel|
  json.id hotel.id
  json.name hotel.name
  json.video_url hotel.video_url
  json.adult_price hotel.adult_price
  json.child_price hotel.child_price
  json.attraction_area_id hotel .attraction_area_id
end