# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	`ruby 2.6.3`

* Configuration
	Run `bundle install` command to insall gems

* Database creation
	Run `rails db:setup` to create database
	Run `rails db:migrate` to migrate all tables

* Database records
	Run `rails db:seed` to create data in DB

* Application Start instructions
	GO inside app folder and run the `rails s` command to start the server

* Modules and Jobs created
	### In schedular define three jobs for scnario mentioned below
	1. Daily, the RewardCalculationJob runs two methods: date_of_birth_reward_calculation and transaction_reward_calculation.
	2. Annually, on December 31st at 11:59 PM, the RewardCalculationJob runs the expire_points method to expire points that accumulate over the year.
	3. Quarterly, at 11:59 PM, the RewardCalculationJob runs the bonus_points method to give 100 bonus points to any user who spends greater than $2000 in that quarter.

	### Rewad Calculation Job
	1. perform(user): Calculates the total points accumulated by a user in the current month and grants rewards accordingly. Updates user tiers based on accumulated points.
	2. date_of_birth_reward_calculation: Grants Free Coffee reward to users whose birthday falls in the current month.
	3. transaction_reward_calculation: Grants 5% Cash Rebate reward to users who have 10 or more transactions with an amount greater than $100.
	4. expire_points: Deletes all points, effectively expiring them, on an annual basis.
	5. bonus_points: Grants a 100-point bonus to users who have spent more than $2000 in the current quarter.