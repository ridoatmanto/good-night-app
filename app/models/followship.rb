class Followship < ApplicationRecord
	belongs_to :user, foreign_key: :followee_id

	def self.followed(user_id)
		self.where(follower_id: user_id)
			.order(created_at: :desc)
			.limit(10)
	end

	def self.followed_ids(user_id)
		self.where(follower_id: user_id)
			.limit(10).pluck(:followee_id)
	end
end
