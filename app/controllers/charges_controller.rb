class ChargesController < ApplicationController
  def new
  end

  def create
  	# Amount in cents
    @amount = 500

    # get customer from POST params
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    begin
      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur'
      )

    p "QS" * 40
    p current_user
    p "AZ" * 40
    current_user.change_post_user_status
    p current_user
    p "ZE" * 40
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
  end
end

