class CreateFootprints < ActiveRecord::Migration
  def change
    create_table :footprints do |t|
      t.string :name
      t.decimal :outward_width
      t.decimal :outward_depth
      t.string :unit

      t.timestamps null: false
    end
  end
end
