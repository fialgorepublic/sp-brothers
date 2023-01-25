class RequestSample < ApplicationRecord
    belongs_to :color, optional: true

    validates :full_name, :address, :mobile_no, presence: true
end
