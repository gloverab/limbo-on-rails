class Discussion < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one :decision
  has_many :replies
  accepts_nested_attributes_for :replies

  validates_presence_of :reason

  default_scope { order(id: :desc) }

  def decision_attributes=(decision_attributes)
    self.build_decision(decision_attributes)
  end

end
