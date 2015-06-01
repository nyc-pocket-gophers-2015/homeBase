require "rails_helper"

describe Task do 
	subject { FactoryGirl.create(:task) }
	context "validations" do
		it { should validate_presence_of :title }
		it { should validate_presence_of :point_value }
    it { should validate_presence_of :family }
  end

  context "associations" do
    it { should belong_to(:family) }
    it { should belong_to(:assigned_member) }
    it { should belong_to(:completed_member) }
	end
end
