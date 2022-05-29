class LocationsController < ApplicationController
  before_action :set_vars

  # GET /model
  def index
    @records = @model.where(game_id: params[:game_id]).all
    @breadcrumb = { "#{home_button}": 'active' }
    render "models/#{@view}/index"
  end

  # GET /model/1
  def show
    @breadcrumb = { 
      "Games": games_path, 
      "#{@game.name}": game_path(@game),
      "#{@record.name}": 'active' }
    render "models/#{@view}/show"
  end

  private
    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:location).permit(:name, :game_id, :avatar)
    end

    def set_vars
      @model = Location
      @index_path = game_locations_path
      @index_url = game_locations_url
      @new_path = new_game_location_path
      @view = @model.name.pluralize.downcase
      if params[:id]
        @record = @model.find(params[:id])
        @show_path = game_location_path(@record)
        @edit_path = edit_game_location_path(@record)
      end
      if params[:game_id]
        @game = Game.find_by(id: params[:game_id])
        @items = Item.for_game(params[:game_id])
        @skills = Skill.for_game(params[:game_id])
      end
    end

    def show_path
      game_location_path(@record, game_id: params[:game_id])
    end
end
