class SessionsController < ApplicationController
  def new
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out."
    redirect_to login_path
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid login. Please try again."
      render :new
    end
  end

end
