json.array!(@chats) do |chat|
  json.extract! chat, :id, :user_one_id, :user_two_id
  json.url chat_url(chat, format: :json)
end
