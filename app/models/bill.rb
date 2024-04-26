class Bill < ApplicationRecord
  belongs_to :user

  after_create :update_user_points, :free_movie_ticket

  private

  def update_user_points
    val = foreign_country.eql?(true) ? 0.2 : 0.1
    points = val * amount
    self.user.update_attribute(:points, user.points + points)

    point_create(points)
    RewardCalculationJob.perform_now(user)
  end

  def point_create(points)
    Point.create(user_id: user.id, score: points)
  end

  def free_movie_ticket
    bills = Bill.where(user_id: user.id)

    if (bills.count.eql?(1)) && (self.amount > 1000)
      UserReward.create(user_id: user.id, reward_id: Reward.movie_ticket.first&.id)
    end
  end
end
