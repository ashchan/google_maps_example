# == Schema Information
# Schema version: 20080627051703
#
# Table name: markers
#
#  id    :integer         not null, primary key
#  lat   :decimal(, )     
#  lng   :decimal(, )     
#  found :string(100)     
#  left  :string(100)     
#  icon  :string(100)     default("")
#

class Marker < ActiveRecord::Base
end
