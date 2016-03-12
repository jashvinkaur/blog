class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :passwords, :string
  end
end
