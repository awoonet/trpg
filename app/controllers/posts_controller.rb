class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_vars

  # GET /posts/1 or /posts/1.json
  def show
    super
  end

  # GET /posts/new
  def new
    @post = Post.new
    super
  end

  # GET /posts/1/edit
  def edit
    super
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."  
    else
      render 'common/edit', status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content)
    end

    def set_vars
      @model = Post
      @index_path = game_location_posts_path
      @new_path = new_game_location_post_path
      @view = @model.name.pluralize.downcase
      if @post
        @record = @post
        @edit_path = edit_game_location_post_path(@post)
      end
    end
end
