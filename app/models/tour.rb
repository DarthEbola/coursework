class Tour < ActiveRecord::Base
  belongs_to :route
  
  validates :date_start, :route_id, presence: true
  validates :count_days, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :add_pay, presence: true, numericality: {greater_than: 0}
  validates :add_description, presence: true
end
