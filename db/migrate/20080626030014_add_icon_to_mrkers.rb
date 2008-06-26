class AddIconToMrkers < ActiveRecord::Migration
  def self.up
    change_table :markers do |t|
      t.string :icon, :limit => 100, :default => ""
    end
  end

  def self.down
    change_table :markers do |t|
      t.remove :icon
    end
  end
end
