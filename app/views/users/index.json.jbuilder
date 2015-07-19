json.array!(@users) do |user|
  json.extract! user, :id, :department_id, :name
  json.url user_url(user, format: :json)
end
