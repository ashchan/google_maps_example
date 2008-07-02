class Tower < ActiveRecord::Base
  def to_json
    self.attributes.to_json
  end
end