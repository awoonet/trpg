class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]
  before_action :set_vars

  # GET /characters or /characters.json
  def index
    @characters = @model.all
    super
  end

  # GET /characters/1 or /characters/1.json
  def show
    super
  end

  # GET /characters/new
  def new
    @character = @model.new
    super
  end

  # GET /characters/1/edit
  def edit
    super
  end

  # POST /characters or /characters.json
  def create
    @character = @model.new(character_params)

    if @character.save
      redirect_to game_characters_path(@character), notice: "#{@model.name.pluralize} was successfully created."
    else
      redirect_to new_game_character_path, alert: "Error! #{@model.name.pluralize} was not created."
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    if @character.update(character_params)
      redirect_to game_characters_path(@character), notice: "#{@model.name.pluralize} was successfully updated."
    else
      redirect_to edit_game_character_path(@character), alert: "Error! #{@model.name.pluralize} was not saved."
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy
    redirect_to @index_path, notice: "Character was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = @model.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name)
    end

    def set_vars
      @model = Character
      @index_path = game_characters_path
      @new_path = new_game_character_path
      @view = @model.name.pluralize.downcase
      if @character
        @record = @character
        @edit_path = edit_game_character_path(@character)
      end
    end
end
