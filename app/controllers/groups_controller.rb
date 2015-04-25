class GroupsController < ApplicationController

 respond_to :html, :js
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users
  end

  def new
    @group = Group.new
  end
  
  def create
    @groups = Group.all
    @group = Group.create(group_params)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @groups = Group.all
    @group = Group.find(params[:id])
    
    @group.update_attributes(group_params)
  end

  def delete
    @group = Group.find(params[:group_id])
  end

  def destroy
    @groups = Group.all
    @group = Group.find(params[:id])
    @group.destroy
  end

private
  def group_params
    params.require(:group).permit(:name)
  end
end
