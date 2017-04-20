class Decision < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :discussion, optional: true
  has_many :votes
  # accepts_nested_attributes_for :options

  def deadline_calculator
    minutes = self.minutes || 0
    hours = self.hours || 0
    new_minutes = minutes + hours_to_minutes(hours)
    Time.now.in_time_zone("Eastern Time (US & Canada)") + new_minutes.minutes
  end

  def hours_to_minutes(hours)
    hours*60
  end

  def votes_for_option_1
    votes.where(persuasion: true).count
  end

  def votes_for_option_2
    votes.where(persuasion: false).count
  end

end
