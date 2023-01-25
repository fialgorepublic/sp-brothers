class Color < ApplicationRecord
    has_many :color_items
	has_many :items, through: :color_items
    belongs_to :request_samples, optional: true
    has_many :cart_colors
    has_many :carts, through: :cart_colors
    mount_uploaders :pictures, PictureUploader
end
