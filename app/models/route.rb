class Route < ActiveRecord::Base
  belongs_to :city
  has_many :tours, :dependent => :destroy

  validates :name, presence: true
  validates :city_id, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
end
