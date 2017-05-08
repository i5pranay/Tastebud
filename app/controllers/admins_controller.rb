class AdminsController < ApplicationController


  before_filter :authenticate_user!, except: [:about_us]
  #user profile routes

  def show_my_profile
    @user = User.find_by(id: current_user.id)

  end

  def new_category_view
    @all_category = Category.all
  end

  def create_category
    @category=Category.new(category_params)
    @category.save


    #============================notification=========================

  
    followed = current_user.friends
    following = current_user.inverse_friends
    friends = followed + following

    friends.uniq.each do |user|
      Notification.create(recipient: user, actor: current_user, action: "Added category", notifiable: @category)

    end

    #=================================================================
   # render :new_category_view ,flash: {notice: "centre successfully updated"}
    redirect_to new_category_path ,flash: {notice: "category successfully updated"}
    a=10
  end

  def edit_category_view
    @category_id = params[:category_id]
    @categories = Category.where(id: @category_id).first
  end

   def update_category
     category_id = params[:category][:id]
     category_type = params[:category][:category_type]
     Category.where(id: category_id).update_all(category_type: category_type )
     a=1
     redirect_to new_category_path, flash: {notice: " category sucessfully updated!!"}

   end

   def destroy_category
     category_id = params[:category_id]
     category_to_delete = Category.where(id: category_id).first
     if category_to_delete.destroy
       @is_deleted = true
     else
       @is_deleted = false
     end
   end

  def about_us

  end

  private

  def category_params
    params.require(:category).permit(:category_type)
  end



end
