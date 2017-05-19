class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  validates_presence_of :username, :first_name, :last_name, :age, :on => :update

  has_many :decisions, foreign_key: "author_id"
  has_many :discussions, foreign_key: "author_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :voted_decisions, through: :votes, source: :decision
  #avadakedavra
  belongs_to :avatar, optional: true
  accepts_nested_attributes_for :decisions

  scope :by_signup, -> {order(id: :asc)}
  scope :most_indecisive, -> {joins(:decisions).group("users.id").order("count(users.id) DESC")}
  scope :most_decisive, -> {joins(:votes).group("users.id").order("count(users.id) DESC")}

  def vote_content(passed_decision)
    v = current_vote_for(passed_decision)
    v.persuasion = true ? passed_decision.option_1 : passed_decision.option_2
  end

  def current_vote_for(passed_decision)
    self.votes.where(decision_id: passed_decision.id).order(id: :desc).first
  end

  def interactions
    (voted_decisions + decisions).sort_by { |x| x.created_at }
  end

  def number_of_decisions_made
    votes.count || 0
  end

  def number_of_dilemmas_posed
    decisions.count || 0
  end

  def most_recent_decision_made
    if vote = self.votes.order(id: :desc).take
      vote.decision
    end
  end

  def most_recent_dilemma_posed
    decisions.order(id: :desc).take
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      names = auth.info.name.split(' ')
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = names[0]
      user.last_name = names[1]
      user.image_path = "http://graph.facebook.com/#{user.uid}/picture?type=large"
      user.save
    end
  end

end
