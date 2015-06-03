require "rails_helper"

describe Medal do 
	subject { FactoryGirl.create(:medal) }
	context "validations" do
		it { should validate_presence_of :title }
		it { should validate_presence_of :img_url }
	end

	context "associations" do
		# it { should have_many(:members) }
	end
end