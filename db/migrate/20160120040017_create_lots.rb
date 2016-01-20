class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :lot_code
      t.date :event_made
      t.date :event_shake
      t.date :event_chill
      t.date :event_remove
      t.integer :cycle_weeks
      t.string :units_type
      t.string :units_number
      t.boolean :active

      t.timestamps null: false
    end
  end
end
