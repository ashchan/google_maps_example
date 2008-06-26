class CreateMarkers < ActiveRecord::Migration
  def self.up
    create_table :markers do |t|
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.string :found, :limit => 100
      t.string :left, :limit => 100
    end
  end

  def self.down
    drop_table :markers
  end
end
