class ChargesController < ApplicationController
  def create

    @amount = params[:charge_amount]
    amount_in_cents = @amount.to_i * 100

    customer = Stripe::Customer.create(
      :email => 'derek@crossway.ca',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount_in_cents.to_i,
      :description => 'Crossway Donation',
      :currency    => 'cad'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to give_path
  end
end
