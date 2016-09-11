class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :board_id, null: false
      t.string :designator
      t.string :footprint
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
