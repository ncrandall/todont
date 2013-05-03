class ListItemsController < ApplicationController
  def index
    @list_items = ListItem.all
  end

  def new
    @list_item = ListItem.new
  end

  def create
    @list_item = ListItem.new(list_params)
    @list_item.done = false;

    if @list_item.save
      flash[:success] = "ToDont item successfully created"
      redirect_to list_items_path
    else
      flash[:error] = "Could not create Todont item"
      render 'new'
    end
  end

  def edit
    @list_item = ListItem.where(:id => params[:id]).first
  end

  def update
    @list_item = ListItem.where(:id => params[:id]).first

    if @list_item.update_attributes(list_params)
      flash[:success] = "Updated Todont item successfully"
      redirect_to list_items_path
    else
      flash[:error] = "Could not update Todont item"
      render 'edit'
    end
  end

  def destroy
    @list_item = ListItem.where(:id => params[:id]).first

    if @list_item.destroy
      flash[:success] = "Todont was successfully deleted"
    else
      flash[:error] = "Could not delete Todont item"
    end

    redirect_to list_items_path
  end

  private
    def list_params
      params.require(:list_item).permit(:title, :done)
    end

end
