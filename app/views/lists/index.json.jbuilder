json.array!(@lists) do |list|
  json.extract! list, :id, :label
  json.url list_url(list, format: :json)
end
