class TasksController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	# before_action :require_login

	def index
		task = Task.where(family_id: session[:user_id], complete: false)
	end

	def create
		if request.xhr?
			p "ajax"
		else
			p "regular"
		end
		@task = Task.new
		@task.point_value = params[:points]
		@task.title = params[:title]
		@task.family_id = current_user.id
		@task.assigned_member_id = params[:name]
		if @task.save
			render json: @task
		end
	end

	def destroy
		@task = Task.find_by(id: params[:task_id])
		if @task.delete
			all_tasks = Task.all
			render json: all_tasks
		end
	end

	def assign_unassigned_task
		p "hello this is me"
		@task = Task.find_by(id: params[:task_id])
		@task.assigned_member_id = params[:member_id]
		@task.save!
		redirect_to :back
	end

	def kid_complete
		task = Task.find_by(id: params[:task_id])
		task.completed_member_id = params[:member_id]
		task.save
		redirect_to :back
	end


	def parent_complete
		task = Task.find_by(id: params[:task_id])
		member = task.completed_member
		task.complete = true
		task.save
		member.task_points += task.point_value
		member.save
		redirect_to :back
	end

	def parent_delete
		task = Task.find_by(id: params[:task_id])
		task.destroy
		redirect_to :back
	end

	def parent_redo
		task = Task.find_by(id: params[:task_id])
		task.completed_member_id = nil
		task.save
		redirect_to :back
	end

	private
	def task_params
		params.require(:task).permit :title, :points, :name, :deadline
	end

	def require_login
		if !current_user

		end
	end
end
