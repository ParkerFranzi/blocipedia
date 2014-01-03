class Subscription < ActiveRecord::Base
  attr_accessible :email, :plan_id, :stripe_customer_token, :user_id
end
