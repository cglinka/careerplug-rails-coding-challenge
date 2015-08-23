class JobsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:search]
      @jobs = current_user.jobs.where('name LIKE ?', "%#{params[:search]}%")
    else
      @jobs = current_user.jobs
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(permitted_params.merge(user: current_user))
    respond_to do |format|
      if @job.save
        format.html { redirect_to root_path, notice: 'Your job has been posted.' }
        fomat.json
      else
        format.html { render :new }
        format.json
      end
    end
  end

  def show
    @job = current_user.jobs.where(id: params[:id]).first
  end

  private

  def permitted_params
    params.require(:job).permit(:name, :description, :status, :employment_type, :user_id, comments_attributes: [:id, :comment, :_destroy])
  end
end
