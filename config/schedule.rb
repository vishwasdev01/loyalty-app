# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron


every 1.day do
  runner "RewardCalculationJob.new.date_of_birth_reward_calculation"
  runner "RewardCalculationJob.new.transaction_reward_calculation"
end

every 1.year, :at => 'December 31th 11:59pm' do
  runner "RewardCalculationJob.new.expire_points"
end

every 3.months, :at => '11:59pm' do
  runner "RewardCalculationJob.new.bonus_points"
end