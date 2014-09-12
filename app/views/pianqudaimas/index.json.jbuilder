json.array!(@pianqudaimas) do |pianqudaima|
  json.extract! pianqudaima, :id, :name, :no, :desc
  json.url pianqudaima_url(pianqudaima, format: :json)
end
