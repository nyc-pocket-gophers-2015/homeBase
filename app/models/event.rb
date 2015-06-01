class Event < ActiveRecord::Base
	belongs_to :member
	belongs_to :family

	validates :title, :event_date, :event_time, :family, presence: :true
	validate :event_in_future
	validate :member_in_family


	private

		def event_in_future
			if (event_date && event_date < Date.today)
				errors.add(:event_date, "has already happened")
			end
		end

		def member_in_family
			if (self.member && self.member.family != self.family)
				errors.add(:member, "is not in your family")
			end
		end
		
end






