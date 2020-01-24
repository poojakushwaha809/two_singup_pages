class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :batch_name
      t.time :starting_time
      t.time :ending_time
      t.integer :faculty_id

      t.timestamps
    end
  end
end
