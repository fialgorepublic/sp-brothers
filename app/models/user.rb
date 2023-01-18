class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_no, presence: true
  validates :phone_no, uniqueness: true

  enum role: {
		'Admin': 'admin',
    'User': 'user'
	}
  
  def email_required?
    false
  end
end
