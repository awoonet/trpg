class CharactersController < ApplicationController
  before_action :set_vars

  # GET /model
  def index
    @records = @model.where(game_id: params[:game_id]).all
    @breadcrumb = { "#{home_button}": 'active' }
    render "models/#{@view}/index"
  end

  private
    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:character).permit(
        :name, :game_id, :avatar,
        :age, :race, :profession, 
        :health, :mana, :money, 
        :strength, :stamina, :accuracy, :agility, 
        :intelligence, :wisdom, :will, :charm,         
        :description, :biography)
    end

    def set_vars
      @model = Character
      @index_path = game_characters_path
      @index_url = game_characters_url
      @new_path = new_game_character_path
      @view = @model.name.pluralize.downcase
      if params[:id]
        @record = @model.find(params[:id])
        @show_path = game_character_path(@record)
        @edit_path = edit_game_character_path(@record)
      end
    end

    def show_path
      game_character_path(@record, game_id: params[:game_id])
    end
end
