class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  #relationships for friend request.
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :recipes
  has_many :ratings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #facebook omniouth

end
