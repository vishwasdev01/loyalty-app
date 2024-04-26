json.extract! user_reward, :id, :user_id, :reward_id, :created_at, :updated_at
json.url user_reward_url(user_reward, format: :json)
