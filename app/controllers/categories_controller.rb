class CategoriesController < ApplicationController
 
  def index
   
    @filter_category = Category.find(params[:category])
   @cate_name = Category.select("category").where(id:params[:category])
    
    
  end
  
  def new
    @category = Category.new
    @events = Event.all.map { |event| [event.name,event.id] }
    
  end

  def create
        @category = Category.new(category_params)
        if @category.save
           redirect_to events_path
        else
          render :new, status: :unprocessable_entity
        end
  end

  

  private
    def category_params
      params.require(:category).permit(:category)
    end
end
