class CreateCharge
  attr_reader :amount, :source

  def initialize(amount, source)
    @amount = amount
    @source = source
  end

  def send_request_to_stripe
    @response = Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      source: source
    )
  end

  def completed?
    return false unless @response
    @response.status == "succeeded"
  end
end
