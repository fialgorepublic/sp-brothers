class Item < ApplicationRecord
	mount_uploader :picture, PictureUploader
	mount_uploaders :product_pictures, PictureUploader
	has_many :color_items
	has_many :colors, through: :color_items
	scope :item_type, ->(category) { where('category = ?', categories[category]) }
	scope :special_item, -> (special_item) { where('special_price_item = ? ', true)}
	accepts_nested_attributes_for :colors, reject_if: :all_blank, allow_destroy: true

	validates :category, :name, :number, :price, presence: true
	enum category: {
		'SYNTHETIC LEATHER': 'sythtntic_leather',
		'OUTSOLE': 'outsole',
		'INSOLE': 'insole',
		'UPPER': 'upper'
	}
end
