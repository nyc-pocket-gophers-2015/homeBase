class MembersController < ApplicationController
	before_action :require_login

	def new
		@member = Member.new
	end

	def create
		@member = Member.new(member_params)
		@member.family_id = current_user.id
		@member.name = @member.name.titleize
		@member.assign_color
		if @member.save
			flash[:message] = "#{@member.name} is now in the family"
		else
			flash[:error] = "Please enter valid information."
		end
			redirect_to :back
	end

	def destroy
		if current_user == member.family
			member = Member.find_by(id: params[:id])
			if member.destroy
				all_members = Member.all
				render json: all_members
				flash[:message] = "#{member.name} is no longer in your family"
			end
		else
			
		end
	end

	def give_reward
		reward = Reward.find_by(id: params[:reward_id])
		member = reward.member
		reward.member.task_points -= reward.cost
		member.save
		reward.status = 'closed'
		reward.save!
		redirect_to :back
	end

	def deny_reward
		reward = Reward.find_by(id: params[:reward_id])
		reward.status = 'open'
		reward.save
		redirect_to :back
	end

	def add_points
		member = Member.find_by(id: params[:name].to_i)
		member.task_points += params[:points].to_i
		member.save
		render json: member
	end

	def remove_points
		member = Member.find_by(id: params[:name].to_i)
		member.task_points -= params[:points].to_i
		member.save
		render json: member
	end

	private
	def member_params
		params.require(:member).permit :name, :img_url
	end

end
