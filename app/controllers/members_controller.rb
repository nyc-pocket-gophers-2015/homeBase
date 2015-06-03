class MembersController < ApplicationController
	before_action :require_login

	def new
		@member = Member.new
	end

	def create
		p params
		@member = Member.new(member_params)
		@member.family_id = current_user.id
		@member.save
		@member.assign_color
		@member.save!
		redirect_to :back
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
		p params
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
		points = params[:points].to_i
		member = Member.find_by(id: params[:name].to_i)
		member.task_points += points
		member.save
		render json: member
	end

	def remove_points
		p params
		points = params[:points].to_i
		member = Member.find_by(id: params[:name].to_i)
		member.task_points -= points
		member.save
		render json: member
	end

	private
	def member_params
		params.require(:member).permit :name, :img_url
	end

	def require_login
		if !current_user
			flash[:error] = "You must be logged in."
		end
	end

end
