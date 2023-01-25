class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_colors
    has_many :colors, through: :cart_colors
end
