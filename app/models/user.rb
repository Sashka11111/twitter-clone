class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  # follow-зв'язки
  has_many :active_follows,  class_name: "Follow", foreign_key: "follower_id",  dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id",  dependent: :destroy
  has_many :following, through: :active_follows,  source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email,    presence: true, uniqueness: true

  def follow(user)
    active_follows.create(followed_id: user.id)
  end

  def unfollow(user)
    active_follows.find_by(followed_id: user.id)&.destroy
  end

  def following?(user)
    following.include?(user)
  end

  # Стрічка новин
  def feed
    Post.where(user_id: following_ids + [id]).order(created_at: :desc)
  end
end
