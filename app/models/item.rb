class Item < ApplicationRecord
	mount_uploader :picture, PictureUploader
	mount_uploaders :product_pictures, PictureUploader
	has_many :color_items
	has_many :colors, through: :color_items
	accepts_nested_attributes_for :colors, reject_if: :all_blank, allow_destroy: true
end
