class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_vars

  # GET /users or /users.json
  def index
    @users = User.all
    super
  end

  # GET /users/1 or /users/1.json
  def show
    super
  end

  # GET /users/new
  def new
    @user = User.new
    super
  end

  # GET /users/1/edit
  def edit
    super
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user), notice: "User was successfully created."
    else
      render 'common/new', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_vars
      @model = User
      @index_path = users_path
      @new_path = new_user_path
      @view = @model.name.pluralize.downcase
      if @user
        @record = @user
        @edit_path = edit_user_path(@user)
      end
    end
end
