class ChapFourController < ApplicationController
  def map
    @stores = Store.all
  end

end
