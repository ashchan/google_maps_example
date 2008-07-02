class AddColumnsToFccStructures < ActiveRecord::Migration
  def self.up
    change_table :fcc_structures do |t|
      t.date :date_constructed
      t.date :date_dismantled
    end
  end
  
  def self.down
    change_table :fcc_structures do |t|
      t.remove :date_constructed
      t.remove :date_dismantled
    end
  end
end
