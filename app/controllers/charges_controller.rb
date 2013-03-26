class ChargesController < ApplicationController
  def create

    @amount = params[:charge_amount] * 100

    customer = Stripe::Customer.create(
      :email => 'derek@crossway.ca',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Crossway Donation',
      :currency    => 'cad'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
