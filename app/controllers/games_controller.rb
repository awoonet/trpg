class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :set_vars

  # GET /games or /games.json
  def index
    @games = Game.all
    super
  end

  # GET /games/1 or /games/1.json
  def show
    super
  end

  # GET /games/new
  def new
    @game = Game.new
    super
  end

  # GET /games/1/edit
  def edit
    super
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game), notice: "Game was successfully created."
    else
      redirect_to new_game_path, alert: "Error! #{@model.name.pluralize} was not created."
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    if @game.update(game_params)
      redirect_to game_path(@game), notice: "Game was successfully updated."
    else
      redirect_to edit_game_path(@game), alert: "Error! #{@model.name.pluralize} was not saved."
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name)
    end

    def set_vars
      @model = Game
      @index_path = games_path
      @new_path = new_game_path
      @view = @model.name.pluralize.downcase
      if @game
        @record = @game
        @edit_path = edit_game_path(@game)
      end
    end
end
