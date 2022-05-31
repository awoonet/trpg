class UsersController < ApplicationController
  before_action :set_vars

  # GET /model
  def index
    if user_is_admin
      @records = @model.all
      render "models/#{@view}/index"
    else
      redirect_to '/error'
    end
  end

  # GET /model/1
  def show
    @breadcrumb["#{@record.name}"] = 'active'
    @chars = Character.where(user_id: @record.id)
    render "models/#{@view}/show"
  end

  # GET /model/1/edit
  def edit    
    if user_is_current_or_admin
      @breadcrumb.merge({ "#{@record.name}": show_path, "Edit": 'active' })
      render 'common/edit'
    else
      redirect_to '/error'
    end
  end

  # PATCH/PUT /model/1
  def update
    if !user_is_current_or_admin
      redirect_to '/error'
    elsif @record.update(model_params)
      redirect_to @show_path, notice: "#{@model.name} was successfully updated."
    else
      redirect_to @edit_path, alert: "Error! #{@model.name} was not updated."
    end
  end

  # DELETE /model/1
  def destroy
    if user_is_current_or_admin
      @record.destroy
      redirect_to @index_path, notice: "#{@model.name} was successfully destroyed."
    else
      redirect_to '/error'
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def model_params
    params.require(:user).permit(
      :name, :email, :avatar, :theme,
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

    if user_is_admin
      @breadcrumb = { "#{home_button}": @index_path }
    else
      @breadcrumb = { "#{home_button}": 'active' }
    end
  end

  def show_path
    user_path(@record)
  end

  def user_is_current_or_admin
    current_user && (current_user.is_admin || current_user.id == params[:id].to_i)
  end
end
