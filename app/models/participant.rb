class Participant < ActiveRecord::Base
  belongs_to :party
  has_and_belongs_to_many :items
  attr_accessible :name
end
