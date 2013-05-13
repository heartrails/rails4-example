json.(@posts) do |post|
  json.partial! post
end