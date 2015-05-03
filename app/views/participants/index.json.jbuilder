json.array!(@participants) do |participant|
  json.extract! participant, :id, :name, :email, :checkin
  json.url participant_url(participant, format: :json)
end
