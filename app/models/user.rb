class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :decisions, foreign_key: "author_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :voted_decisions, through: :votes, source: :decision
  belongs_to :avatar, optional: true

  scope :by_signup, -> {order(id: :asc)}
  scope :most_indecisive, -> {joins(:decisions).group("users.id").order("count(users.id) DESC")}
  scope :most_decisive, -> {joins(:votes).group("users.id").order("count(users.id) DESC")}

  def vote_content(interaction)
    vote = self.votes.find { |vote| vote.decision == interaction }
    vote.option.content
  end

  def vote_option(passed_decision)
    v.persuasion = true ? passed_decision.option_1 : passed_decision.option_2
  end


  def current_vote_for(passed_decision)
    self.votes.where(decision_id: passed_decision.id).order(id: :desc).first
  end


  def interactions
    decisions_made.concat(self.decisions.order(id: :desc)).uniq.reverse
  end

  def decisions_made
    votes.order(id: :desc).collect{|x| x.decision}.uniq
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

  def avatar_display
    avatar.capitalize + '-icon.png'
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      names = auth.info.name.split(' ')
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = names[0]
      user.last_name = names[1]

      user.save
      user.avatar = Avatar.create(name: auth.info.name, image_path: "http://graph.facebook.com/#{user.uid}/picture?type=large")
    end
  end

end
