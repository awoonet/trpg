class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]
  before_action :set_vars

  # GET /locations/1 or /locations/1.json
  def show
    super
  end

  # GET /locations/new
  def new
    @location = Location.new
    super
  end

  # GET /locations/1/edit
  def edit
    super
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to location_url(@location), notice: "Location was successfully created."
    else
      render 'common/new', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      redirect_to location_url(@location), notice: "Location was successfully updated."
    else
      render 'common/edit', status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
      redirect_to locations_url, notice: "Location was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name)
    end

    def set_vars
      @model = Location
      @index_path = game_locations_path
      @new_path = new_game_location_path
      @view = @model.name.pluralize.downcase
      if @location
        @record = @location
        @edit_path = edit_game_location_path(@location)
      end
    end
end
