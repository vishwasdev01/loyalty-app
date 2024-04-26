class Bill < ApplicationRecord
  belongs_to :user

  after_create :update_user_points, :free_movie_ticket

  scope :within_60_days, -> { where('created_at >= ?', 60.days.ago) }

  def self.total_spending_within_60_days_for_user(user)
    user.bills.within_60_days.sum(:amount)
  end

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

  # Free Movie Tickets reward is given to new users when their spending is > $1000 within 60 days of their first transaction
  def free_movie_ticket    
    if created_at >= 60.days.ago && Bill.total_spending_within_60_days_for_user(user) > 1000
      UserReward.create(user_id: user.id, reward_id: Reward.movie_ticket.first&.id)
    end
  end
end
