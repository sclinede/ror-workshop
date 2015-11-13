class StudentPaymentsController < ApplicationController
  expose(:student_payments) { StudentPayment.includes(:student).order('due_date DESC') }
end
