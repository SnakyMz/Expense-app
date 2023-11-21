class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.create(entity_params)
    @entity.group = @group
    @entity.author = current_user
    if @entity.save
      flash[:success] = 'Transaction created!'
      redirect_to group_path(@entity.group)
    else
      flash[:error] = 'Something went wrong!'
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
