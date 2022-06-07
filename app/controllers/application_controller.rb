class ApplicationController < ActionController::Base
  before_action :set_common_vars
  include Pagy::Backend

  # GET /model
  def index
    @pagy, @records = pagy(@model.order(params[:order]), items: params[:items])
    @breadcrumb = { "#{home_button}": 'active' }
    render "models/#{@view}/index"
  end

  # GET /model/1
  def show
    @breadcrumb = { 
      "#{home_button}": @index_path, 
      "#{@record.name}": 'active' }
    render "models/#{@view}/show"
  end

  # GET /model/new
  def new
    @record = @model.new
    @breadcrumb = { 
      "#{home_button}": @index_path, 
      "New #{@model.name.humanize}": 'active' }
    render 'layouts/new'
  end

  # GET /model/1/edit
  def edit
    @breadcrumb = { 
      "#{home_button}": @index_path, 
      "#{@record.name}": @show_path,
      "Edit": 'active' }
    render 'layouts/edit'
  end

  # POST /model
  def create
    @record = @model.new(model_params)
    if @record.save
      redirect_to show_path, notice: "#{@model.name} was successfully created."
    else
      redirect_to @new_path, alert: "Error! #{@model.name} was not created."
    end
  end

  # PATCH/PUT /model/1
  def update
    if @record.update(model_params)
      redirect_to @show_path, notice: "#{@model.name} was successfully updated."
    else
      redirect_to @edit_path, alert: "Error! #{@model.name} was not updated."
    end
  end

  # DELETE /model/1
  def destroy
    @record.destroy
    redirect_to @game_path, notice: "#{@model.name} was successfully destroyed."
  end

  private

  def home_button
    @model.name.humanize.pluralize
  end

  def set_common_vars
    if params[:game_id]
      @game = Game.signed_in?(current_user).find_by id: params[:game_id] 
      @game_path = game_path @game.id 
      @chars = Character.where(game_id: @game.id, user_id: current_user.id)
    end
    if params[:location_id]
      @location = Location.find_by id: params[:location_id]
    end
  end

  def user_is_admin
    current_user && current_user.is_admin
  end
end
