class RenameNicknames < ActiveRecord::Migration
  def change
    rename_table :nicknames, :mh_nickanmes
  end
end
