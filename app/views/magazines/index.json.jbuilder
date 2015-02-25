json.array!(@magazines) do |magazine|
  json.extract! magazine, :id, :name, :description, :picture, :price, :user_id
  json.url magazine_url(magazine, format: :json)
end
