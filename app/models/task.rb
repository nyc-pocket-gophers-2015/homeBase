class Task < ActiveRecord::Base
	belongs_to :family
	belongs_to :assigned_member, class_name: "Member", foreign_key: :assigned_member_id
	belongs_to :completed_member, class_name: "Member", foreign_key: :completed_member_id

	validates :title, :point_value, :family, presence: true
	validates :point_value, numericality: {only_integer: true}
	validate :assigned_member_in_family
	validate :completed_member_in_family


	private
		def assigned_member_in_family
			if (self.assigned_member && self.assigned_member.family != self.family)
				errors.add(:member, "is not in your family")
			end
		end

		def completed_member_in_family
			if (self.completed_member && self.completed_member.family != self.family)
				errors.add(:member, "is not in your family")
			end
		end
end
