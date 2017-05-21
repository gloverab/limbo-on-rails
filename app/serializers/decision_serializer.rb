class DecisionSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :deadline, :votes_for_option_1, :votes_for_option_2
  has_many :votes
end
