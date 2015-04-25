class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to action: 'index', controller: 'groups'
    end
  end

  def create
    group_id = user_params[:group_id]
    group = Group.find(group_id.to_i)
    users = params[:user][:users].reject { |x| x.empty?}
    if !users.empty?
      users.each do |user|
        group.users << User.find(user.to_i) if (!user.empty? && !User.find(user.to_i).nil?)
      end
      redirect_to '/'
    else
      @user = User.new(user_params)
      if @user.save
        group = Group.find(group_id)
        group.users << @user
        respond_to do |format|
          format.html { redirect_to '/'}
        end
      else
        render 'new'
      end
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def user_params
     params.require(:user).permit!
  end
end
