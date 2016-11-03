class UsersController < ApplicationController
  before_action :auth_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You've created an account."
      log_in(@user)
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
    	flash[:success] = "Profile updated"
    	redirect_to @user
    else
    	render 'edit'
    end
  end

  def destory
    current_user.destroy

    redirect_to root_url
  end

  private

  def auth_user
    if logged_in?
       @user = User.find_by(id: params[:id])
       redirect_to root_url unless @user == current_user
    else
      flash.now[:notice] = "Please log in to continue"
      redirect_to login_url
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end