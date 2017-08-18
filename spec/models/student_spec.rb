require 'rails_helper'

RSpec.describe Student, type: :model do
	let(:test_student) { create(:student) }
  it { is_expected.to have_many(:student_courses) }
  it { is_expected.to validate_presence_of(:name) }
  
  describe "attributes" do
    it "has name" do
      expect(test_student).to have_attributes(name: test_student.name)
    end
  end
end
