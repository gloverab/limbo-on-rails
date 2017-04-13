class Decision < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :votes

  def deadline_calculator
    minutes = self.minutes + hours_to_minutes(self.hours)
    Time.now + minutes.minutes
  end

  def hours_to_minutes(hours)
    hours*60
  end
end
