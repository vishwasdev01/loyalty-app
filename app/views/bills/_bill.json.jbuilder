json.extract! bill, :id, :amount, :foreign_country, :user_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
