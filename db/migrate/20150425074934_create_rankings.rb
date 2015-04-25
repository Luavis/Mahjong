class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :is_half, default: 1
      t.boolean :is_recorded, default: false

      t.integer :log_1_id, null: true
      t.integer :log_2_id, null: true
      t.integer :log_3_id, null: true
      t.integer :log_4_id, null: true

      t.boolean :is_deleted, default: false

      t.integer :kml_id, null: false

      t.timestamps null: false
    end
  end
end
