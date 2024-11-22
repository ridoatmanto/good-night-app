class SleepingTime < ApplicationRecord
	belongs_to :user

	def self.clock_in_list(user_id)
		self.where(user_id: user_id)
			.order(created_at: :desc)
			.limit(10)
			.pluck(:clock_in)
	end

	def self.clock_out_list(user_id)
		self.where(user_id: user_id)
			.order(created_at: :desc)
			.limit(10)
			.select(:clock_in, :clock_out, :duration_in_minutes, :created_at)
	end

	def self.week_ago(ids)
		self.where(user_id: ids, created_at: 7.days.ago..Time.now.in_time_zone("Asia/Jakarta"))
			.order(duration_in_minutes: :desc, created_at: :desc)
	end
end
