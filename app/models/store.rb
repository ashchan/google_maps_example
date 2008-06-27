# == Schema Information
# Schema version: 20080627051703
#
# Table name: stores
#
#  id       :integer         not null, primary key
#  name     :string(50)      
#  address  :string(100)     
#  address2 :string(100)     
#  city     :string(50)      
#  state    :string(2)       
#  zip      :string(9)       
#  phone    :string(15)      
#  lat      :string(20)      
#  lng      :string(20)      
#

class Store < ActiveRecord::Base
  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end
