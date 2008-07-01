class CreateFccTables < ActiveRecord::Migration
  def self.up
    create_table :fcc_locations do |t|
      t.integer :unique_si
      t.integer :lat_deg
      t.integer :lat_min
      t.float   :lat_sec
      t.string  :lat_dir, :limit => 1
      t.float   :latitude
      t.integer :long_deg
      t.integer :long_min
      t.float   :long_sec
      t.string  :long_dir, :limit => 1
      t.float   :longitude
    end
    
    add_index :fcc_locations, :unique_si
    
    create_table :fcc_owners do |t|
      t.integer :unique_si
      t.string :name, :limit => 200
      t.string :address, :limit => 35
      t.string :city, :limit => 20
      t.string :state, :limit => 2
      t.string :zip, :limit => 10
    end
    
    add_index :fcc_owners, :unique_si
    
    create_table :fcc_structures do |t|
      t.integer :unique_si
      t.string :address, :limit => 80
      t.string :city, :limit => 20
      t.string :state, :limit => 2
      t.float :height
      t.float :elevation
      t.float :ohag
      t.float :ohamsl
      t.string :structure_type, :limit => 6
    end
    
    add_index :fcc_structures, :unique_si
  end

  def self.down
    drop_table :fcc_structures
    drop_table :fcc_owners
    drop_table :fcc_locations
  end
end
