json.array!(@tollstationips) do |tollstationip|
  json.extract! tollstationip, :id, :oldnetwork, :oldplaza, :oldip, :newnetwork, :newplaza, :newip, :tollstation_id
  json.url tollstationip_url(tollstationip, format: :json)
end
