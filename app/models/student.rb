class Student < ApplicationRecord
	has_many :student_courses, dependent: :destroy
	validates :name, presence: true
end
