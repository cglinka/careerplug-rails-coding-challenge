class CommentsController < ApplicationController
  # GET /jobs/1/comments/new
  def new
    @job = current_user.jobs.find(params[:job_id])
    @comment = @job.comments.new
  end

  def create
    @job = current_user.jobs.find(params[:job_id])
    @comment = @job.comments.create!(comment: params[:comment])
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.js
    end
  end

  # DELETE /jobs/1/comments/1
  def destroy
  end

  private

  def permitted_params
    params.require(:comment).permit(:comment, :job_id)
  end
end
