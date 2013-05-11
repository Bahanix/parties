class Party < ActiveRecord::Base
  attr_accessible :description, :location, :name, :slug, :start_at
end
