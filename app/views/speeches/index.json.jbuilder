json.array!(@speeches) do |speech|
  json.extract! speech, :id
  json.url speech_url(speech, format: :json)
end
