class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :board_id, null: false
      t.integer :footprint_id
      t.string :designator
      t.decimal :mid_x
      t.decimal :mid_y
      t.decimal :ref_x
      t.decimal :ref_y
      t.decimal :pad_x
      t.decimal :pad_y
      t.string :tb
      t.decimal :rotation
      t.string :comment
      t.string :unit

      t.timestamps null: false
    end
  end
end
