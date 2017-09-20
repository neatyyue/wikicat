class Api::V1::GraphController < ApplicationController
  def show
    cat = params[:category] || 'sports'
    @category = Category.where(:cat_title => cat.capitalize).first
    if @category
      @links = Link.where(:cl_to => @category.cat_title,
                          :cl_type => "subcat")
      render :json => @links, each_serializer: LinkSerializer
    else
      render :json => {:error => {:text => "404 Not Found", :status => 404}}
    end
  end
  private
  def graph_params
    params.require(:category).permit(:cl_to, :cl_type)
  end
end
