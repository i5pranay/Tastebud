class NavigationsController < ApplicationController

  def home
    if !user_signed_in?
      redirect_to  new_user_registration_path
    end
  end

  def new_recipe_view
    @categories = Category.select(:id, :category_type).all();

  end

  def create_recipe
    @recipe=Recipe.new(persist_recipe_params)
    @recipe.save
    # render :new_category_view ,flash: {notice: "centre successfully updated"}
    redirect_to new_recipe_path ,flash: {notice: "category successfully updated"}
    a=10

  end

  private

  def persist_recipe_params
      strong_recipe_params = recipe_params
      strong_recipe_params[:user_id] = current_user.id
      strong_recipe_params
  end

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :category_id, :content, :recipe_img)
  end

  end


