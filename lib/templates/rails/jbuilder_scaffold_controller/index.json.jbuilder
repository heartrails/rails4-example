json.(@<%= plural_table_name %>, <%= attributes_list %>) do |<%= singular_table_name %>|
  json.url <%= singular_table_name %>_url(<%= singular_table_name %>, format: :json)
end
