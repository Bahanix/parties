class Participant < ActiveRecord::Base
  belongs_to :party
  attr_accessible :name
end
