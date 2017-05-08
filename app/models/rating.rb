class Rating < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_many  :users,  dependent: :destroy
  has_many :notifications, as: :notifiable
end
