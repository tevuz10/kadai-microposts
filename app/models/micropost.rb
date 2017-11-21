class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likes
  has_many :likedusers, through: :likes, source: :user
  
  def liked?
    self.likedusers.include(user)
  end
end
