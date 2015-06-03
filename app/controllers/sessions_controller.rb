class SessionsController < ApplicationController
  def create
    user = Family.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to :back
    else
      flash.now[:danger] = "Invalid email or password"
    end
  end

  def destroy
    session.clear
    redirect_to :back
  end

  def admin
    user = Family.find_by(id: session[:user_id])
    if user.authenticate(params[:password])
      session[:admin] = true
      redirect_to :back
    end
  end

  def normal_mode
    session[:admin] = nil
    redirect_to :back
  end
end
