class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :college
      t.integer :contact

      t.timestamps null: false
    end
  end
end
