class UsersController < ApplicationController
  before_action :set_vars

  private
    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:user).permit(
        :name, :email, :avatar,
        :password, :password_confirmation)
    end

    def set_vars
      @model = User
      @index_path = users_path
      @index_url = users_url
      @new_path = new_user_path
      @view = @model.name.pluralize.downcase
      if params[:id]
        @record = @model.find(params[:id])
        @show_path = user_path(@record)
        @edit_path = edit_user_path(@record)
      end
      if params[:game_id]
        @game = Game.find_by(id: params[:game_id])
        @items = Item.for_game(params[:game_id])
        @skills = Skill.for_game(params[:game_id])
      end
    end

    def show_path
      user_path(@record)
    end
end
