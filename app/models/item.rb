class Item < ActiveRecord::Base
  belongs_to :party
  has_and_belongs_to_many :participants
  attr_accessible :name
end
