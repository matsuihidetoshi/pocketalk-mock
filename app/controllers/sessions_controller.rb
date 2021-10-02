class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in.'
      redirect_to root_url
    else
      flash[:danger] = 'Failed to log in.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out.'
    redirect_to login_url
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
