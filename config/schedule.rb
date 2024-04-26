# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron


every 1.day do
  runner "RewardCalculationJob.new.date_of_birth_reward_calculation"
  runner "RewardCalculationJob.new.transaction_reward_calculation"
end

# Points expire every year
every 1.year, :at => 'December 31th 11:59pm' do
  runner "RewardCalculationJob.new.expire_points"
end

# Every calendar quarterly give 100 bonus points for any user spending greater than $2000 in that quarter
every 3.months, :at => '11:59pm' do
  runner "RewardCalculationJob.new.bonus_points"
end