class CreateSubjectItems < ActiveRecord::Migration
  def change
    create_table :subject_items do |t|
      t.string :title, null: false
      t.references :teacher
    end

    create_table :participations do |t|
      t.references :subject_item
      t.references :student
    end

    add_index :subject_items, :teacher_id
    add_index :participations, :student_id
    add_index :participations, :subject_item_id
  end
end
