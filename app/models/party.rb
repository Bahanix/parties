class Party < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessible :description, :location, :name, :slug, :start_at
end
