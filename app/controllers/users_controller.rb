class UsersController < ApplicationController
  
  def index
    @users = User.all
    @users.sort!{|a,b| b.score <=> a.score}
  end
  
  def show
    @user = User.find(params[:id])
    @submissions = @user.submissions
  end
  
end
