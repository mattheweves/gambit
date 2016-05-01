class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|

      t.string :title
      t.text :description
      t.string :category
      t.date :targetdate
      t.text :finishline
      t.integer :user_id

      t.timestamps
    end

    add_index :goals, :user_id

  end
end
