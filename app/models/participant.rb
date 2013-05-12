class Participant < ActiveRecord::Base
  belongs_to :party
  has_and_belongs_to_many :items
  attr_accessible :name
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :party_id

  def short_name
    splitted = name.split ' '
    splitted.many? ? splitted.first(2).map{|w| w[0]}.join.upcase : name[0..1].downcase.capitalize
  end

  def color
    name.to_s(16).first(6)
  end

end
