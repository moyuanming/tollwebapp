json.array!(@gljdaimas) do |gljdaima|
  json.extract! gljdaima, :id, :name, :no, :desc
  json.url gljdaima_url(gljdaima, format: :json)
end
