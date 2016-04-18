require "rails_helper"

RSpec.describe CreateCharge do
  let(:amount) { 5000 }
  let(:source) do
    {
      number: "4242424242424242",
      exp_year: "19",
      exp_month: "12",
      cvc: "123"
    }
  end

  subject { described_class.new(amount, source) }

  describe "#send_request_to_stripe" do
    it "sends the right messages to the Stripe::Charge object" do
      expect(Stripe::Charge)
        .to receive(:create)
        .with(amount: 5000, currency: 'usd', source: source)

      subject.send_request_to_stripe
    end
  end

  describe "#completed?" do
    it "returns false if no response has been received" do
      expect(subject.completed?).to eq(false)
    end

    context "when successful" do
      let(:response_double) { double(status: "succeeded") }

      it "returns true" do
        subject.instance_variable_set(:@response, response_double)
        expect(subject.completed?).to eq(true)
      end
    end

    context "when unsuccessful" do
      let(:response_double) { double(status: "happy") }

      it "returns false" do
        subject.instance_variable_set(:@response, response_double)
        expect(subject.completed?).to eq(false)
      end
    end
  end
end
