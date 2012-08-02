class Micropost < ActiveRecord::Base
  attr_accessible :content #, :user_id

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}

  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user) 
	#followed_user_ids = user.followed_user_ids
	#where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
	# the above is equivalent to the following
	#where("user_id IN (:followed_user_ids) OR user_id = :user_id", followed_user_ids: followed_user_ids, user_id: user)

	followed_user_ids = "SELECT  followed_id FROM relationships WHERE follower_id = :user_id"
	where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)

  end
end