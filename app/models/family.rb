class Family < ActiveRecord::Base
	has_secure_password
	has_many :members, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :rewards, dependent: :destroy
	has_many :tasks, dependent: :destroy

	validates :surname, :email, :password, presence: true
	validates :email, uniqueness: true
	validates :password, length: { in: 6..20 }

end
