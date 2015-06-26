class SessionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new
    if session[:user_id]
      redirect_to "/tasks"
    end
  end

  def create
    user = Family.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to :root
    else
      if params[:password].length < 6
        flash.now[:danger] = "Password must be at least 6 characters."
      else
        flash.now[:danger] = "Invalid email or password"
      end
      render action: "new"
    end
  end

  def destroy
    session.clear
    redirect_to :root
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
    redirect_to :root
  end
end
