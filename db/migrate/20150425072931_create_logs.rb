class CreateLogs < ActiveRecord::Migration
  def change
    create_table :mh_logs do |t|

      t.integer :ranking_id, null: false
      t.integer :nickname_id, null: false
      t.integer :point, null: false
      t.integer :grade, null: false
      t.integer :wind_type, null: false

      t.timestamps null: false
    end

  end
end
