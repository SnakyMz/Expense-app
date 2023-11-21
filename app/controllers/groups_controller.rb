class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @group.author = current_user
    if @group.save
      flash[:success] = 'Category created!'
      redirect_to groups_path
    else
      flash[:error] = 'Something went wrong!'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end