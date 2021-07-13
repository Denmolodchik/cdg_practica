class User < ApplicationRecord
  EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness:true
  validates :email, format: { with: EMAIL_FORMAT, message: "Invalid email" }
  validates :name, presence: true, uniqueness:true, length: { maximum: 20 }

  has_many :follower_follows, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :following_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :following_follows, source: :following
end
