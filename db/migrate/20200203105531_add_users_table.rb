class AddUsersTable < ActiveRecord::Migration[5.2]
  def change
  	    add_column :users, :student_name, :string
  	    add_column :users, :student_address, :string
  	    add_column :users, :contact_number, :integer
        add_column :users, :college_name, :string
  	    add_column :users, :student_image, :string
  	    add_column :users, :batch_id, :integer


  end
end
