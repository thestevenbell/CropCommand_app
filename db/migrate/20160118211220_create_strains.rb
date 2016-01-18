class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :primary_key
      t.string :strain_id
      t.string :strain_code, limit: 120
      t.string :source_original, limit: 60
      t.string :commercial_name, limit: 30
      t.string :common_name, limit: 60
      t.string :latin_name, limit: 90
      t.string :form_received, limit: 60
      t.date :date_acquired
      t.string :photo_url, limit: 600
      t.text :notes

      t.boolean :completed, null: false

      t.timestamps null: false
    end
    add_index :strains, :strain_id, unique: true
  end
end
