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
    redirect_to show_recipe_path(:recipe_id => @recipe.id)
    a=10
  end

  def show_recipe
    @show_recipe = Recipe.find(params[:recipe_id])
    a=10
    @final_rating = get_avg_rating_for_recipe(params[:recipe_id])
  end

  def edit_recipe
    @categories = Category.select(:id, :category_type).all();
    @recipe_id = params[:recipe_id]
    @recipe_details = Recipe.where(id: @recipe_id).first
  end

  def update_recipe
    ActiveRecord::Base.transaction do
    recipe_id = params[:recipe][:id]
    @recipe = Recipe.find(recipe_id)
    recipe_name = params[:recipe][:recipe_name]
    category_id = params[:recipe][:category_id]
    content = params[:recipe][:content]
    img= params[:recipe][:recipe_img]
    @recipe.update_attributes(recipe_img: img)
    Recipe.where(id: recipe_id).update_all(recipe_name: recipe_name, category_id: category_id, content: content)

    redirect_to show_recipe_path(:recipe_id => recipe_id)
    end
  end

  def list_my_recipe
    @all_recipe = Recipe.where(user_id: current_user.id)
  end

  def destroy_recipe
    recipe_id = params[:recipe_id]
    recipe = Recipe.where(id: recipe_id).first
    recipe.destroy
    redirect_to root_path ,flash: {notice: "recipe successfully deleted"}
  end

  def rate_recipe
    # persist the new data in db
    rating = Rating.new(persist_rating_params)
    rating.save

    # calculate the new average rating

    final_rating = get_avg_rating_for_recipe(params[:rating][:recipe_id])

    # create the json response and send back
    response = {
        recipe_id: params[:rating][:recipe_id],
        avg_rating: final_rating
    }
    render json: response
  end

  def get_avg_rating_for_recipe(recipe_id)
    all_ratings = Rating.select(:rating_value).where(recipe_id: recipe_id).all
    total_rating = 0
    all_ratings.each do |r|
      total_rating += r.rating_value
    end
    a=0
    final_rating = total_rating.to_f / all_ratings.size
  end


  private

  def persist_recipe_params
      strong_recipe_params = recipe_params
      strong_recipe_params[:user_id] = current_user.id
      strong_recipe_params
  end

  def persist_rating_params
    strong_rating_params = rating_params
    strong_rating_params[:user_id] = current_user.id
    strong_rating_params
  end

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :category_id, :content, :recipe_img)
  end

  def rating_params
    params.require(:rating).permit(:recipe_id,:rating_value )
  end

end


