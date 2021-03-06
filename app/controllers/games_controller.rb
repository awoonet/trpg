class GamesController < ApplicationController
  before_action :set_vars

    # GET /model/1
    def show
      @pagy, @locations = pagy(Location.for_game(@record.id).order(params[:order]), items: params[:items])
      super
    end

  private

  # Only allow a list of trusted parameters through.
  def model_params
    params.require(:game).permit(
      :name, :description, :avatar, 
      :nsfw, :whitelisted, admins: [],
      whitelist: [], blacklist: [])
  end
  
  def set_vars
    @model = Game.signed_in?(current_user)
    @index_path = games_path
    @index_url = games_url
    @new_path = new_game_path
    @view = @model.name.pluralize.downcase
    if params[:id]
      @record = @model.find(params[:id])
      @show_path = game_path(@record)
      @edit_path = edit_game_path(@record)
    end
  end

  def show_path
    game_path(@record)
  end
end
