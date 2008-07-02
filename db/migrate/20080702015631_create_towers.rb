class CreateTowers < ActiveRecord::Migration
  def self.up
    create_table :towers do |t|
      t.float :latitude
      t.float :longitude
      t.string :owner_name, :limit => 200
      t.string :owner_address, :limit => 35
      t.string :owner_city, :limit => 20
      t.string :owner_state, :limit => 2
      t.string :owner_zip, :limit => 10
      t.string :address, :limit => 35
      t.string :city, :limit => 20
      t.string :state, :limit => 2
      t.float :height
      t.float :elevation
      t.float :ohag
      t.float :ohamsl
      t.string :structure_type, :limit => 6
    end
    
    add_index :towers, :state
    add_index :towers, :latitude
    add_index :towers, :longitude
  end

  def self.down
    drop_table :towers
  end
end
