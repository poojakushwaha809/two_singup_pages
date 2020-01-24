class CreateFaculties < ActiveRecord::Migration[5.2]
  def change
    create_table :faculties do |t|
      t.string :faculty_name
      t.integer :contact
      t.string :email

      t.timestamps
    end
  end
end
