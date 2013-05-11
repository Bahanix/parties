class Party < ActiveRecord::Base
  extend FriendlyId
  has_many :participants
  has_many :items
  friendly_id :name, use: [:slugged, :history]
  attr_accessible :description, :location, :name, :slug, :start_at
  validates_presence_of :name
end
