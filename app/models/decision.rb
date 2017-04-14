class Decision < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :options
  has_many :votes, through: :options
  accepts_nested_attributes_for :options

  def deadline_calculator
    minutes = self.minutes || 0
    hours = self.hours || 0
    new_minutes = minutes + hours_to_minutes(hours)
    Time.now + new_minutes.minutes
  end

  def hours_to_minutes(hours)
    hours*60
  end
end
