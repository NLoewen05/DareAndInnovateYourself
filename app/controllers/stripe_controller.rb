class StripeController < ApplicationController

  respond_to :json

  def process_payment

    stripe_token = params[:stripe_token]

    charge =  Stripe::Charge.create(
      :amount => 2000, # in cents
      :currency => 'cad',
      :source => stripe_token,
      :description => "Test Charge"
    )

    render :status => 200,
           :json => charge
  end
end
