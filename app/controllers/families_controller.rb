class FamiliesController < ApplicationController
  before_action :require_login, except:[:create]

  def index
    @family = Member.where(family_id: session[:user_id])
  end


  def create
  	@new_family = Family.new(family_params)
  	if @new_family.save
      session[:user_id] = @new_family.id
      session[:admin] = true
      flash[:message] = "Congratulations on signing up"
    else
      if params["family"]["password"].length < 6
        flash[:danger] = "Password must be at least 6 characters."
      else
        flash[:danger] = "Please enter valid information."
      end
    end
    redirect_to :root
  end

  def destroy
  	family = Family.find_by(id: current_user.id)
  	if family.destroy
  		flash[:success] = "Your account has been deleted"
  	end
  end

  private
  def family_params
  	params.require(:family).permit :surname, :email, :password
  end
end
