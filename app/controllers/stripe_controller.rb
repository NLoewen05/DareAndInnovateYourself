class StripeController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:process_mobile_payment]

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

  def process_mobile_payment
    stripe_token = params[:stripe_token]
    grandTotal = params[:charge_total].to_f * 100
    
    charge =  Stripe::Charge.create(
      :amount => grandTotal.to_i, # in cents
      :currency => 'cad',
      :source => stripe_token,
      :description => "Mobile Test Charge"
    )

    render :status => 200,
            :json => charge
  end
end
