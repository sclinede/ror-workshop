require 'spec_helper'

feature 'User checks student payments' do
  let(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:student_payment) do
    create :student_payment, student: student, payment_date: nil, due_date: '2015-10-25'
  end

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'not paid'
    expect(page).to have_content '2015-10-25'
  end
end
