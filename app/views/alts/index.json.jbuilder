json.array!(@alts) do |alt|
  json.extract! alt, :id
  json.url alt_url(alt, format: :json)
end
