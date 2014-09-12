json.array!(@tollstations) do |tollstation|
  json.extract! tollstation, :id, :name, :oldnetwork, :oldplaza, :oldip, :newnetwork, :newplaza, :newip, :pianqudaima_id, :gljdaima_id
  json.url tollstation_url(tollstation, format: :json)
end
