class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :decision_id
end
