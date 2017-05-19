class UserSerializer < ActiveModel::Serializer
  attributes :id, :interactions, :number_of_decisions_made, :number_of_dilemmas_posed
  has_many :decisions
  has_many :voted_decisions
end
