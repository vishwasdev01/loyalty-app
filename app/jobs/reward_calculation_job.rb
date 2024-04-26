class RewardCalculationJob < ApplicationJob
  queue_as :default

  def perform(user)
    points = Point.where(user_id: user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month)
    total_score = points.pluck(:score).sum

    if total_score >= 100
      UserReward.create(user_id: user.id, reward_id: Reward.coffee.first.id)
    end

    if user.points.eql?(1000)
      user.update_attribute(:tier, "vip")
      UserReward.create(user_id: user.id, reward_id: Reward.airport_lounge_access.first.id)
    elsif (user.points == 5000 )
      user.update_attribute(:tier, "premium")
    end
  end


  def date_of_birth_reward_calculation
    users = User.where(date_of_birth: Time.now.beginning_of_month..Time.now.end_of_month)
    users.find_each do |user|
      UserReward.create(user_id: user.id, reward_id: Reward.birthday_coffee.first.id)
    end
  end

  def transaction_reward_calculation
    users = User.joins(:bills).group('users.id').having('count(bills.id) >= 10')
    user.find_each do |user|
      total = Bill.where(user_id: user.id).pluck(:amount).sum
      if total >= 100
        UserReward.create(user_id: user.id, reward_id: Reward.cash_rebate.first.id)
      end
    end
  end

  def expire_points
    Point.destroy_all
  end

  def bonus_points
    users = User.joins(:bills).where("bills.amount > ? ", 2000)
    users.find_each do |user|
      user.update_attribute(:points, user.points + 100)
    end
  end
end
