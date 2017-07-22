class User < ApplicationRecord

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum:30 }
  validates :email, presence: true, length: { maximum:60 }, format: { with: EMAIL_FORMAT }

end
