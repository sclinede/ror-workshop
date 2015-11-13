FactoryGirl.define do
  factory :student_payment do
    due_date { Faker::Date.backward }
    payment_date { Faker::Date.backward }
  end
end
