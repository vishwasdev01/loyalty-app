class Reward < ApplicationRecord
	scope :coffee, -> { where(name: 'Coffee') }
	scope :airport_lounge_access, -> { where(name 'Airport Lounge Access') }
	scope :birthday_coffee, -> { where(name: 'Birthday Coffee') }
	scope :cash_rebate, -> { where(name: '5% Cash Rebate') }
	scope :movie_ticket, -> { where(name: '5% Cash Rebate') }
end
