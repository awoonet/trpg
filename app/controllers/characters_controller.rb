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
        :name, :game_id, :user_id, :avatar, :age, 
        :race, :profession, :health, :money, 
        :max_health, :energy, :max_energy, 
        :strength, :stamina, :accuracy, :agility, 
        :intelligence, :wisdom, :will, :charm,         
        :description, :biography, items: [], skills: [])
    end

    def set_vars
      @model = Character
      @view = @model.name.pluralize.downcase
      if params[:id]
        @record = @model.find(params[:id]) 
        @game = Game.find_by(id: @record.game_id)
        @show_path = show_path
        @edit_path = edit_path
      end

      if request.path.include?('games')
        @index_path = game_characters_path
        @index_url = game_characters_url
        @new_path = new_game_character_path
      end
    end

    def show_path
      if request.path.include?('games')
        game_character_path(@record, game_id: @record.game_id)
      elsif request.path.include?('users')
        user_character_path(@record, user_id: @record.user_id)
      end
    end

    def edit_path
      if request.path.include?('games')
        edit_game_character_path(@record, game_id: @record.game_id)
      elsif request.path.include?('users')
        edit_user_character_path(@record, user_id: @record.user_id)
      end
    end
end
