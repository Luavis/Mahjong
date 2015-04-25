class RenameRanking < ActiveRecord::Migration
  def change
    rename_table :rankings, :mh_rankings
  end
end
