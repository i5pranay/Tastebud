class Category < ActiveRecord::Base
  has_many :recipes
  belongs_to :user, dependent: :destroy
  has_many :notifications, as: :notifiable
end
