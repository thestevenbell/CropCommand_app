json.array!(@strains) do |strain|
  json.extract! strain, :id, :title, :completed
  json.url strain_url(strain, format: :json)
end
