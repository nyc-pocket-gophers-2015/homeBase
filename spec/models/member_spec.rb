require "rails_helper"

describe Member do 
	subject { FactoryGirl.create(:member) }
	context "validations" do
		it { should validate_presence_of :role }
		it { should validate_presence_of :name }
		it { should validate_presence_of :family }
		it { should validate_presence_of :color }
		it { should validate_presence_of :img_url }
	end

	context "associations" do
		it { should have_many(:events) }
		it { should have_many(:rewards) }
		it { should have_many(:assigned_tasks) }
		it { should have_many(:completed_tasks) }
		it { should belong_to(:family) }
	end
end
