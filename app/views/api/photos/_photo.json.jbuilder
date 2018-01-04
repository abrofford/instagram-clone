json.id photo.id
json.title photo.title
json.url photo.image.url(:medium)
json.create_at photo.created_at
json.updated_at photo.updated_at

json.comments photo.comments.each do |comment|
  json.user_email comment.user.email
  json.body comment.body
end
