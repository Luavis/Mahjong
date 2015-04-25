class CreateNicknames < ActiveRecord::Migration
  def change
    create_table :nicknames do |t|
      t.string 'nickname', null: false
      t.integer 'kml_id', null: false
      t.integer 'elo_point', default: 1400
      t.integer 'standard_point', default: 0
      t.timestamps null: false
    end
  end
end
