class Member < ApplicationRecord

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }

  attachment :avatar

  has_many :follower_relationships,  foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :follower_relationships,  source: :follower

  has_many :following_relationships, foreign_key: :follower_id,  class_name: "Follow"
  has_many :following, through: :following_relationships, source: :following

  has_many :posts

  def follow(member)
    following_relationships.create(following_id: member.id)
  end

  def unfollow(member)
    following_relationships.find_by(following_id: member.id).destroy
  end
end
