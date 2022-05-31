class ErrorsController < ApplicationController
  def not_found
    @title = "Page not found"
    @text = "The page you were looking for does not exist"
    render 'pages/errors', status: 404
  end

  def internal_server_error
    @title = "Internal server error"
    @text = "An error occured on the server"
    render 'pages/errors', status: 500
  end

  def unprocessable
    @title = "Unprocessable Entity"
    @text = "Server unable to process instructions"
    render 'pages/errors', status: 422
  end

  def unacceptable
    @title = "Not Acceptable"
    @text = "Server cannot produce a response"
    render 'pages/errors', status: 406
  end
end
