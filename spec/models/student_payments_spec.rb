require 'rails_helper'

RSpec.describe StudentPayment do
  describe 'database columns' do
    it { should have_db_column :due_date }
    it { should have_db_column :payment_date }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
