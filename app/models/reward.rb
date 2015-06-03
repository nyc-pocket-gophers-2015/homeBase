class Reward < ActiveRecord::Base
	belongs_to :family
	belongs_to :member

	validates :name, :cost, :family, presence: true
	validates :cost, numericality: {only_integer: true, greater_than: 0}
	validate :member_in_family


	private
	def member_in_family
		if (self.member && self.member.family != self.family)
			errors.add(:member, "is not in your family")
		end
	end
end
