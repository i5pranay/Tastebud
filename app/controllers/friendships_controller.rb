class FriendshipsController < ApplicationController

before_action :authenticate_user!


   def index
     @user = User.all

   end

   def show
   @user = current_user
   end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save

    #============================notification=========================

  
    followed = current_user.friends
    following = current_user.inverse_friends
    friends = followed + following

    friends.uniq.each do |user|
      Notification.create(recipient: user, actor: current_user, action: "added friend", notifiable: @friendship)

    end

    #=================================================================
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendships."
    redirect_to root_url
  end

end
