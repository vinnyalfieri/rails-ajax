class ListsController < ApplicationController
  def index
    @lists = List.order("created_at DESC")
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      if request.xhr?
        # somehow only send back the html for the page update
        render :layout => false
      else
        redirect_to root_path
      end
    else
      @lists = List.all
      render :index
    end
  end


  private
    def list_params
      params.require(:list).permit(:name)
    end
end
