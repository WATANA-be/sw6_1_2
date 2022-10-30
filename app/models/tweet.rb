class Tweet < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
  has_many :like_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy
  
  def like(user)
    likes.create(user_id: user.id)
  end

  def liked?(user)
    like_users.include?(user)
  end
  
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
end
