class Color < ApplicationRecord
    has_many :color_items
	has_many :items, through: :color_items
    has_many :request_samples
    mount_uploaders :pictures, PictureUploader
end
