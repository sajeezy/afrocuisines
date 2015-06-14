class Receipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients
	has_many :instructions

	accepts_nested_attributes_for :ingredients,
  								   reject_if: proc { |attributes| attributes['name'].blank? },
  								   allow_destroy: true
 	accepts_nested_attributes_for :instructions,
  								   reject_if: proc { |attributes| attributes['step'].blank? },
  								   allow_destroy: true

  
	has_attached_file :image, :styles => { :medium => "400x400#>"}

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
