class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  before_action :get_routes, only: [:edit, :update]
  skip_before_action :check_app_auth, only: [:index, :show]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.includes(:route).references(:route)
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  def search
    if params.has_key?('search')
      @tours = Tour.search(params['search'])
    else
      @tours = []
    end
    params['search'] ||= {}
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    if @tour.route.tours.size == 1
      @tour.route.city.destroy if (@tour.route.city.routes.size ==1) && (@tour.route.city.excursions.size == 0)
      @tour.route.destroy 
    end
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:route_id, :date_start, :count_days, :add_pay, :add_description,
        route_attributes: [:name, :city_id, :description, :price, :id, :_destroy,
          city_attributes: [:name, :id, :_destroy]]
      )
    end

    def get_routes
      @routes = Route.all
    end
end
