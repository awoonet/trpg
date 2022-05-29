class GamesController < ApplicationController
  before_action :set_vars

  private
    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:game).permit(:name, :description, :avatar)
    end

    def set_vars
      @model = Game
      @index_path = games_path
      @index_url = games_url
      @new_path = new_game_path
      @view = @model.name.pluralize.downcase
      if params[:id]
        @record = @model.find(params[:id])
        @show_path = game_path(@record)
        @edit_path = edit_game_path(@record)
        @items = Item.for_game(params[:id])
        @skills = Skill.for_game(params[:id])
      end
    end

    def show_path
      game_path(@record)
    end
end
