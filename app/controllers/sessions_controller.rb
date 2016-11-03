class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
  	if params[:session][:login].include?("@")
      user = User.find_by(email: params[:session][:login].downcase)
    else
      user = User.find_by(username: params[:session][:login])
    end

    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to root_url
    else
      flash.now[:notice] = "That combination doesn't seem to exist."
      render 'new'
    end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end

  private

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end