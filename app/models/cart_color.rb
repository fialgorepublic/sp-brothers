class CartColor < ApplicationRecord
    belongs_to :color
    belongs_to :cart
end
