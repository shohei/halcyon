class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :board_id
      t.string :footprint_id
      t.string :comment
      t.decimal :start_x
      t.decimal :start_y 
      t.string :amount
      t.string :unit

      t.timestamps null: false
    end
  end
end
