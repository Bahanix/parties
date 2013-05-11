class Party < ActiveRecord::Base
  attr_accessible :description, :end_at, :location, :name, :owner, :start_at
end
