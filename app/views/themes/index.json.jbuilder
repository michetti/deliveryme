json.array!(@themes) do |theme|
  json.extract! theme, :name, :description, :path
  json.url theme_url(theme, format: :json)
end
