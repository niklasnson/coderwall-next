if current_user
  json.authorUrl user_path(current_user)
  json.authorUsername current_user.username
end
json.chatChannel @stream.dom_id
json.pusherKey ENV['PUSHER_KEY']
json.signedIn !!current_user

json.stream do
  json.extract! @stream, :id, :archived_at
  json.recording_started_at @stream.recording_started_at.try(:to_i)
end

json.comments @comments, partial: 'comments/comment', as: :comment
