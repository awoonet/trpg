class PostsController < ApplicationController
  before_action :set_vars

  # GET /model/1
  def show 
    respond_to do |format|
      format.turbo_stream { render 'models/posts/show' }
      format.html { render 'models/posts/show' }
    end
  end

  # GET /model/new
  def new
    @post = Post.new
    render 'models/posts/new'
  end

  def create
    @post = Post.new(model_params)
  
    if @post.save
      respond_to do |format|
        format.html { redirect_to location_path, notice: "Quote was successfully created." }
        format.turbo_stream { render 'models/posts/create' }
      end
    else
      render 'models/posts/new', status: :unprocessable_entity
    end
  end

  # GET /model/1/edit
  def edit
    render 'models/posts/edit'
  end

  def update  
    if @post.update(model_params)
      respond_to do |format|
        format.html { redirect_to location_path, notice: "Quote was successfully updated." }
        format.turbo_stream { render 'models/posts/update' }
      end
    else
      render 'models/posts/new', status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to location_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { render 'models/posts/delete' }
    end
  end
  
  private

  # Only allow a list of trusted parameters through.
  def model_params
    params.require(:post).permit(:content, :character_id, :location_id)
  end
  
  def set_vars
    @chars = Character.where game_id: @game.id, user_id: current_user.id
    @location = Location.find_by id: params[:location_id]
    @model = Post
    if params[:id]
      @post = Post.find_by id: params[:id]
      @char = @post.character
    end
  end

  def location_path
    game_location_path(game_id: @game.id, location_id: @location.id)
  end
end
