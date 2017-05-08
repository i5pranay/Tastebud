class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  #relationships for friend request.
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :recipes
  belongs_to :rating
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #facebook omniouth

  #notificaation
  has_many :notifications, foreign_key: :recipient_id

end
