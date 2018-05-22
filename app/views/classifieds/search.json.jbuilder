json.classifieds do
  json.array!(@classifieds) do |classified|
    json.name classified.title
    json.url classified_path(classified)
  end
end

json.categories do
  json.array!(@categories) do |category|
    json.name category.name
    json.url category_path(category)
  end
end
