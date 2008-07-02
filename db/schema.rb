# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080702015631) do

  create_table "fcc_locations", :force => true do |t|
    t.integer "unique_si", :limit => 11
    t.integer "lat_deg",   :limit => 11
    t.integer "lat_min",   :limit => 11
    t.float   "lat_sec"
    t.string  "lat_dir",   :limit => 1
    t.float   "latitude"
    t.integer "long_deg",  :limit => 11
    t.integer "long_min",  :limit => 11
    t.float   "long_sec"
    t.string  "long_dir",  :limit => 1
    t.float   "longitude"
  end

  add_index "fcc_locations", ["unique_si"], :name => "index_fcc_locations_on_unique_si"

  create_table "fcc_owners", :force => true do |t|
    t.integer "unique_si", :limit => 11
    t.string  "name",      :limit => 200
    t.string  "address",   :limit => 35
    t.string  "city",      :limit => 20
    t.string  "state",     :limit => 2
    t.string  "zip",       :limit => 10
  end

  add_index "fcc_owners", ["unique_si"], :name => "index_fcc_owners_on_unique_si"

  create_table "fcc_structures", :force => true do |t|
    t.integer "unique_si",        :limit => 11
    t.string  "address",          :limit => 80
    t.string  "city",             :limit => 20
    t.string  "state",            :limit => 2
    t.float   "height"
    t.float   "elevation"
    t.float   "ohag"
    t.float   "ohamsl"
    t.string  "structure_type",   :limit => 6
    t.date    "date_constructed"
    t.date    "date_dismantled"
  end

  add_index "fcc_structures", ["unique_si"], :name => "index_fcc_structures_on_unique_si"

  create_table "markers", :force => true do |t|
    t.decimal "lat",                  :precision => 15, :scale => 10
    t.decimal "lng",                  :precision => 15, :scale => 10
    t.string  "found", :limit => 100
    t.string  "left",  :limit => 100
    t.string  "icon",  :limit => 100,                                 :default => ""
  end

  create_table "stores", :force => true do |t|
    t.string "name",     :limit => 50
    t.string "address",  :limit => 100
    t.string "address2", :limit => 100
    t.string "city",     :limit => 50
    t.string "state",    :limit => 2
    t.string "zip",      :limit => 9
    t.string "phone",    :limit => 15
    t.string "lat",      :limit => 20
    t.string "lng",      :limit => 20
  end

  create_table "towers", :force => true do |t|
    t.float  "latitude"
    t.float  "longitude"
    t.string "owner_name",     :limit => 200
    t.string "owner_address",  :limit => 35
    t.string "owner_city",     :limit => 20
    t.string "owner_state",    :limit => 2
    t.string "owner_zip",      :limit => 10
    t.string "address",        :limit => 35
    t.string "city",           :limit => 20
    t.string "state",          :limit => 2
    t.float  "height"
    t.float  "elevation"
    t.float  "ohag"
    t.float  "ohamsl"
    t.string "structure_type", :limit => 6
  end

  add_index "towers", ["state"], :name => "index_towers_on_state"
  add_index "towers", ["latitude"], :name => "index_towers_on_latitude"
  add_index "towers", ["longitude"], :name => "index_towers_on_longitude"

end
