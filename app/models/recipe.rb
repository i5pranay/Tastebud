class Recipe < ActiveRecord::Base
  belongs_to :user
  has_one :categories
  belongs_to :category
  has_many :recipe_img
  has_many  :ratings

  has_attached_file :recipe_img, styles: { recipe_index: "250x350>", recipe_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :recipe_img, content_type: /\Aimage\/.*\z/


end
