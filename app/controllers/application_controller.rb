class ApplicationController < ActionController::Base
  # GET /model or /model.json
  def index
    render 'common/index'
  end

  # GET /model/1 or /model/1.json
  def show
    render 'common/show'
  end

  # GET /model/new
  def new
    render 'common/new'
  end

  # GET /model/1/edit
  def edit
    render 'common/edit'
  end
end
