class FccStructure < ActiveRecord::Base
  set_primary_key 'unique_si'
  has_one :fcc_location, :foreign_key => "unique_si"
  has_one :fcc_owner, :foreign_key => "unique_si"
end