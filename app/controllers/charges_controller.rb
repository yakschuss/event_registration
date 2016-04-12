class ChargesController < ApplicationController

  def new
    @amount = 500
      @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Ticket Purchase",
      amount: @amount
    }

  end

  def create
    @amount = 500
    customer = Stripe::Customer.create(
      #email: #need to get attendee email somehow,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      #description: "#{attendee.email}",
      currency: 'usd'
    )

    flash[:notice] = "Payment received - Event Ticket Type: "
    redirect_to #event show (@event?)

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

end

#Amount class needed?
