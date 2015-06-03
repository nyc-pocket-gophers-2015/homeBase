require "rails_helper"

describe Event do
	subject { FactoryGirl.create(:reward) } 
	context "validations" do
		it { should validate_presence_of :name }
		it { should validate_presence_of :cost }
		it { should validate_presence_of :family }
		it { should validate_numericality_of(:cost).only_integer }
		it do
      should validate_numericality_of(:cost).
        is_greater_than(0)
    end
	end

	context "associations" do
		it { should belong_to(:member) }
		it { should belong_to(:family) }
	end
end