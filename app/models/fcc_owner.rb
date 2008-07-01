class FccOwner < ActiveRecord::Base
  set_primary_key 'unique_si'
  has_one :fcc_location, :foreign_key => "unique_si"
  has_one :fcc_structure, :foreign_key => "unique_si"
end