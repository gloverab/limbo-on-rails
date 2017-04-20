class Discussion < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one :decision
  has_many :replies
  accepts_nested_attributes_for :decision
  accepts_nested_attributes_for :replies
end
