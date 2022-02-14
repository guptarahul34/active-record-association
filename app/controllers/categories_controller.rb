class CategoriesController < ApplicationController
  def new
    @category = Category.new
    @category.user_id = current_user.id
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
      params.require(:category).permit(:category,:user_id)
    end
end
