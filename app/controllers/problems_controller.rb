class ProblemsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.all
    @current_problems = Problem.find(:all, :conditions => ["current_problem = ?", true])
    @old_problems = Problem.find(:all, :conditions => ["current_problem = ?", false])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find(params[:id])
    @submissions = @problem.submissions.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem = Problem.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @problem }
    end
  end

  # GET /problems/1/edit
  def edit
    @problem = Problem.find(params[:id])
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(params[:problem])

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, :notice => 'Problem was successfully created.' }
        format.json { render :json => @problem, :status => :created, :location => @problem }
      else
        format.html { render :action => "new" }
        format.json { render :json => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /problems/1
  # PUT /problems/1.json
  def update
    @problem = Problem.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to @problem, :notice => 'Problem was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :ok }
    end
  end
  
  def close
    problem = Problem.find(params[:id])
    score_list = Array.new
    
    problem.submissions.each do |submission|
      score_list.push(submission.script.length)
    end
    
    score_list.sort!
    total = score_list.size
    
    problem.submissions.each do |submission|
      score = total - score_list.index(submission.script.length)
      submission.user.score += score
      submission.user.save
    end
    problem.update_attribute(:current_problem, false)
    redirect_to problem
  end
  
  protected
    def record_not_found
      flash[:error] = 'The problem you requested could not be found'
      redirect_to root_url
    end
    
    def make_current
      Problem.all.each do |problem|
        problem.current = false
        problem.save
      end
      @problem = Problem.find(params[:id])
      @problem.current = true
      @problem.save
    end
  
end
