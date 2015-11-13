class CreateStudentPayments < ActiveRecord::Migration
  def change
    create_table :student_payments do |t|
      t.references :student, index: true
      t.date :due_date, null: false
      t.date :payment_date
    end

    add_index :student_payments, [:student_id, :due_date], unique: true
  end
end
