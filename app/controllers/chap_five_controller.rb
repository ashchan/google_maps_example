class ChapFiveController < ApplicationController
  def map
    structures = FccStructure.find_all_by_state 'HI', :include => [:fcc_owner, :fcc_location]
    @towers = Array.new
    structures.each do |s|
      @towers.push({ :latitude => s.fcc_location.latitude, :longitude => s.fcc_location.longitude, :name => s.address})
    end
  end
end
