class SessionsController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Login Sucessful!"
      redirect_to "/contacts"
    else
      flash[:warning] = "Invalid email or password...please try again."
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logout Successful!  You may log in again."
    redirect_to "/login"
  end

end
