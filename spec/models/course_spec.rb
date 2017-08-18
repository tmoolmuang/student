require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:test_course) { create(:course) }
  it { is_expected.to validate_presence_of(:name) }
  
  describe "attributes" do
    it "has name" do
      expect(test_course).to have_attributes(name: test_course.name)
    end
  end
end
