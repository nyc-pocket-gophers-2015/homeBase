class Event < ActiveRecord::Base
	belongs_to :member
	belongs_to :family

	validates :title, :start_time, :end_time, :family, presence: :true
	validate :event_in_future
	validate :member_in_family


	private

		def event_in_future
			if (start_time && start_time< Date.today)
				errors.add(:start_time, "has already happened")
			end
		end

		def member_in_family
			if (self.member && self.member.family != self.family)
				errors.add(:member, "is not in your family")
			end
		end

end






