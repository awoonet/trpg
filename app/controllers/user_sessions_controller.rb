class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    
    if @user
      redirect_to root_path, notice: 'Login successful'
    else
      redirect_to login_path, alert: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
