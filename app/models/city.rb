class City < ActiveRecord::Base
  has_many :routes, :dependent => :destroy
  has_many :excursions, :dependent => :destroy

  validates :name, presence: true
end
