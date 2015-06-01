class Medal < ActiveRecord::Base
	has_many :members

	validates :title, :img_url, presence: true
end
