json.array!(@classifieds) do |classified|
    json.extract! classified, :id, :name
    json.url classifieds_url(classified, format: :json)
  end