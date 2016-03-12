class RemoveFieldPassword < ActiveRecord::Migration
    def up
    remove_column :passwords, :users
  end
end
