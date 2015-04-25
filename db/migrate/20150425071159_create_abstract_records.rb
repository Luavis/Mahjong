class CreateAbstractRecords < ActiveRecord::Migration
  def change
    create_table :abstract_records do |t|

      t.timestamps null: false
    end
  end
end
