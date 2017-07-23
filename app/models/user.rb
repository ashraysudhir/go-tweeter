class User < ApplicationRecord

  has_many :tweets, dependent: :destroy

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum:30 }
  validates :email, presence: true, length: { maximum:60 }, format: { with: EMAIL_FORMAT }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum:6}, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def feed
    Tweet.where("user_id = ?", id)
  end

end
