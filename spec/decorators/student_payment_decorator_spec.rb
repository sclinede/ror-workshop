require 'rails_helper'

describe StudentPaymentDecorator do
  describe "#formatted_payment_date" do
    describe "when payment assigned" do
      subject { create(:student_payment, payment_date: '2015-10-11').decorate.formatted_payment_date }
      it { is_expected.to eq '2015-10-11' }
    end

    describe "when payment is not assigned" do
      subject { create(:student_payment, payment_date: nil).decorate.formatted_payment_date }
      it { is_expected.to eq 'not paid' }
    end
  end
end
