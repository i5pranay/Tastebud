class AdminsController < ApplicationController

  def new_category_view

  end

  def create_category
    @category=Category.new(category_params)
    @category.save
   # render :new_category_view ,flash: {notice: "centre successfully updated"}
    redirect_to new_category_path ,flash: {notice: "category successfully updated"}
    a=10
  end


  private

  def category_params
    params.require(:category).permit(:category_type)
  end



end
