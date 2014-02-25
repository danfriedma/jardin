json.array!(@comments) do |comment|
  json.extract! comment, :id, :owner, :text
  json.url comment_url(comment, format: :json)
end
