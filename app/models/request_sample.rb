class RequestSample < ApplicationRecord
    has_many :colors

    validates :full_name, :address, :mobile_no, presence: true
end
