class User < ApplicationRecord
	has_many :users
	has_many :sleeping_times
end
