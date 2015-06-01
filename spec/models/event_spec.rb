require "rails_helper"

describe Event do
	subject { FactoryGirl.create(:event) } 
	context "validations" do
		it { should validate_presence_of :title }
		it { should validate_presence_of :event_date }
		it { should validate_presence_of :event_time }
		it { should validate_presence_of :family }
	end

	context "associations" do
		it { should belong_to(:member) }
		it { should belong_to(:family) }
	end
end
