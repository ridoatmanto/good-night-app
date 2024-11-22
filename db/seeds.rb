# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed User
User.create([
	{ id: 1, name: 'Valentino' },
	{ id: 2, name: 'Joaquin' },
	{ id: 3, name: 'Angel' },
	{ id: 4, name: 'Juliana' },
	{ id: 5, name: 'Dylan' },
	{ id: 6, name: 'Allen' },
	{ id: 7, name: 'Omari' },
	{ id: 8, name: 'Octavia' },
	{ id: 9, name: 'James' },
	{ id: 10, name: 'Kristopher' }
])
puts "-" * 34
puts "           START SEEDING"
puts "-" * 34
puts "* Success seeds Users"

# Seed SleepingTimes Sample
time_list = []
duration = [420, 480, 410, 430, 440]
variation = [15, 30, 10, 20, 8]
now = DateTime.now
previous_day = 1.day.ago

(1..10).to_a.each do |user_id|
	random_duration = duration.sample
	random_variation = variation.sample
	next_random_variation = variation.sample
	time_list.concat([
		{
			user_id: user_id,
			clock_in: now - random_variation.minutes,
			clock_out: now + random_duration.minutes,
			duration_in_minutes: random_duration + random_variation
		},
		{
			user_id: user_id,
			clock_in: previous_day - next_random_variation.minutes,
			clock_out: previous_day + random_duration.minutes,
			duration_in_minutes: random_duration + next_random_variation
		}
	])
end

SleepingTime.create(time_list)
puts "* Success seeds SleepingTime"


# Seed followships 
follow_list = []

(1..10).to_a.each do |follower_id|
	(1..10).to_a.each do |followee_id|
		unless follower_id == followee_id
			follow_list << {follower_id: follower_id, followee_id: followee_id}
		end
	end
end

Followship.create(follow_list)

puts "* Success seeds Followship"
puts "-" * 34
puts "            SEEDING END"
puts "-" * 34