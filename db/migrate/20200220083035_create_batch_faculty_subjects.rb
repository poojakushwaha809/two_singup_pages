class CreateBatchFacultySubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :batch_faculty_subjects do |t|
      t.integer :batch_id
      t.integer :faculty_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
