class Route < ActiveRecord::Base
  belongs_to :city
  has_many :tours, :dependent => :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}

  accepts_nested_attributes_for :city, allow_destroy: true
end
