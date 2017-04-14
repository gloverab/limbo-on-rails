class Option < ActiveRecord::Base
  belongs_to :decision, required: false
  has_many :votes

  def vote_count
    self.votes.count
  end
end
