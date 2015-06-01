class MembersController < ApplicationController
	before_action :require_login

	def new
		@member = Member.new
	end

	def create
		@member = Member.new(member_params)
		@member.family_id = current_user.id
		@member.save
		@member.assign_color
		@member.save
	end

	def destroy
		if current_user == member.family
			member = Member.find_by(id: params[:id])
			if member.destroy
				all_members = Member.all
				render json: all_members
			end
		else
			#can't delete someone not in your family.
		end
	end

	def give_reward
		member = Member.find_by(id: params[:member_id])
		reward = Reward.find_by(id: params[:reward_id])
		member.task_points -= reward.cost
		member.save
		reward.status = 'closed'
	end

	def deny_reward
		reward = Reward.find_by(id: params[:reward_id])
		reward.status = 'open'
	end

	def add_points points
		member = Member.find_by(id: params[:member_id])
		member.task_points += points
		member.save
	end

	def remove_points points
		member = Member.find_by(id: params[:member_id])
		member.task_points -+ points
		member.save
	end

	private
	def member_params
		params.require(:member).permit :role, :name
	end

	def require_login
		if !current_user
			flash[:error] = "You must be logged in."
		end
	end

end
