class ApplicationController < ActionController::Base
  # GET /model or /model.json
  def index
    @breadcrumb = { "#{home_button}": 'active' }
    render 'common/index'
  end

  # GET /model/1 or /model/1.json
  def show
    @breadcrumb = { "#{home_button}": @index_path, "#{@record.name}": 'active' }
    render 'common/show'
  end

  # GET /model/new
  def new
    @breadcrumb = { "#{home_button}": @index_path, "New #{@model.name.humanize}": 'active' }
    render 'common/new'
  end

  # GET /model/1/edit
  def edit
    @breadcrumb = { "#{home_button}": @index_path, "Edit #{@record.name}": 'active' }
    render 'common/edit'
  end

  private

  def home_button
    @model.name.humanize.pluralize
  end
end
