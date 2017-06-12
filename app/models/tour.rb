class Tour < ActiveRecord::Base
  belongs_to :route
  validates :date_start, presence: true
  validates :count_days, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :add_pay, presence: true, numericality: {greater_than: 0}
  validates :add_description, presence: true

  accepts_nested_attributes_for :route, allow_destroy: true

  def self.search(params)
    result = Tour.includes(:route => :city).references(:city)

    if params['route'].present?
      result = result.where(routes: {name: params['route']})
    end
    if params['city_name'].present?
      result = result.where(cities: {name: params['city']})
    end

    if params['date_start'].present?
      result = result.where(date_start: Date.parse(params['date_start']))
    end
    if params['count_days'].present?
      result = result.where(count_days: params['count_days'])
    end

    if params['description'].present?
      result = result.where(routes: {description: params['description']})
    end

    if params['add_description'].present?
      result = result.where(add_description: params['add_description'])
    end
    
    if params['price'].present?
      result = result.where(routes: {price: params['price']})
    end
    if params['add_pay'].present?
      result = result.where(add_pay: params['add_pay'])
    end
    result.all
  end
end