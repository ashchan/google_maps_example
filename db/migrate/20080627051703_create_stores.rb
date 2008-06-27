class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :name, :limit => 50
      t.string :address, :limit => 100
      t.string :address2, :limit => 100
      t.string :city, :limit => 50
      t.string :state, :limit => 2
      t.string :zip, :limit => 9
      t.string :phone, :limit => 15
      t.string :lat, :limit => 20
      t.string :lng, :limit => 20
    end
  end

  def self.down
    drop_table :stores
  end
end
