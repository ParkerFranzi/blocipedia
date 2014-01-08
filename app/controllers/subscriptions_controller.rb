class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save_with_payment
      current_user.update_attribute(:role, 'premium')
      @subscription.update_attribute(:user_id, current_user.id)
      redirect_to @subscription, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  def edit
    @subscription = current_user.subscription
  end

  def update
    cu = Stripe::Customer.retrieve(current_user.subscription.stripe_customer_token)
    if cu.cancel_subscription
      current_user.update_attribute(:role, 'member')
      current_user.subscription.destroy
      redirect_to root_path, :notice => "Thank you for trying Premium"
      
    else
      flash[:notice] = "Sorry canceling your subscription failed."
      render :edit
    end
  end

  def show
  end
end
