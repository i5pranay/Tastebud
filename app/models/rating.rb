class Rating < ActiveRecord::Base
  belongs_to :recipe, dependent: :destroy
  belongs_to  :user,  dependent: :destroy
end
