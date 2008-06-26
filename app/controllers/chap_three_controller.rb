class ChapThreeController < ApplicationController
  # inputForm in application.js was hard-coded, without the auth token
  protect_from_forgery :except => 'create' 
  
  def map
  end

  def create
    marker = Marker.new(params[:m])
    if marker.save
      res = {:success => true, :content => "<div><strong>found</strong> #{marker.found}</div><div><strong>left</strong> #{marker.left}</div>", :icon => marker.icon }
    else
      res = {:success => false, :content => "could not save the marker"}
    end
    render :text => res.to_json
  end
  
  def list
    render :text => Marker.all.to_json
  end
end
