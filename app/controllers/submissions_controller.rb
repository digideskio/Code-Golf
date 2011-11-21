class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @submission = Submission.find(params[:id])
  end
  
  def create
    @problem = Problem.find(params[:problem_id])
    @submission = @problem.submissions.build(params[:submission])
    @submission.user = current_user
    @submission.script = @submission.script.gsub(/\r\n/, "\n")
    @submission.save
    
    respond_to do |format|
      if @submission.save
        format.html { redirect_to(@problem, :notice => 'Submission was successfully created.') }
      else
        format.html { redirect_to(@problem, :notice => 'There was an error saving your submission (empty submission or submission way to long).') }
      end
    end
  end
  
  def destroy
    @submission = current_user.submissions.find(params[:id])
    @problem = Problems.find(params[:problem_id])
    @submission.destroy
    
    redirect_to @problem
  end

end
