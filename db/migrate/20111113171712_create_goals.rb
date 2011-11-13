class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :description
      t.date :completion_date
      t.string :comment
      t.string :category

      t.timestamps
    end
  end
end
