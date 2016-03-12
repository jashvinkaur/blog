class CreateFollos < ActiveRecord::Migration
  def change
    create_table :follos do |t|
      t.integer :following
      t.integer :follower

      t.timestamps null: false
    end
  end
end
