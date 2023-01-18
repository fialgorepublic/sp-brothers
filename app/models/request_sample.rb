class RequestSample < ApplicationRecord
    belongs_to :item

    validates :full_name, :address, :mobile_no, presence: true
end
