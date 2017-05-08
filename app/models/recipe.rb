class Recipe < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_one :categories
  belongs_to :category
  has_many :recipe_img
  belongs_to  :rating
  has_many :notifications, as: :notifiable

  has_attached_file :recipe_img, styles: { recipe_index: "250x350>", recipe_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :recipe_img, content_type: /\Aimage\/.*\z/

  def self.search(search)
    where("recipe_name LIKE ?", "%#{search}%")
  end


end
