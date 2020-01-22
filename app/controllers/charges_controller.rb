class ChargesController < ApplicationController
  before_action :authenticate_user, only: [:create]
  def new
    if amount_isvalid?(params[:amount])
      @amount = params[:amount]
      @offerstype = params[:offerstype]
    else
      redirect_to offerservice_index_path
    end
  end

  def create
    # Amount in cents
    if amount_isvalid?(params[:amount])
      @amount = params[:amount].to_i
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

      current_user.change_post_user_status
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      end
    else
      redirect_to offerservice_index_path
    end
    
  end

  # Check if params amount sending via form is valid
  def amount_isvalid?(amount)
    amount = amount.to_i
    gold = 100
    ruby = 300
    diamond = 500
    if amount === gold || amount === ruby || amount === diamond
      return true
    else
      return false
    end
  end
end

