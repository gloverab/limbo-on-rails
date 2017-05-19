class VoteSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :decision
end
