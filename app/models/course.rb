class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses

  def sorted_grades_by_course
    self.student_courses.order(grade: :desc)
  end
end
