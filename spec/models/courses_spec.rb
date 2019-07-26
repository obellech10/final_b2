require "rails_helper"

RSpec.describe Course, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :student_courses}
    it { should have_many(:students).through(:student_courses)}
  end

  describe 'Instance Methods' do
    before :each do
      @sam = Student.create!(name: 'Sam')
      @diane = Student.create!(name: 'Diane')
      @woody = Student.create!(name: 'Woody')
      @norm = Student.create!(name: 'Norm')

      @algebra = Course.create!(name: 'Algebra')

      @student_courses_1 = @algebra.student_courses.create!(student_id: @sam.id, grade: 3.0)
      @student_courses_2 = @algebra.student_courses.create!(student_id: @diane.id, grade: 3.4)
      @student_courses_3 = @algebra.student_courses.create!(student_id: @woody.id, grade: 3.5)
      @student_courses_4 = @algebra.student_courses.create!(student_id: @norm.id, grade: 2.5)
    end

    it '.sorted_grades_by_course' do
      sorted = [@student_courses_3, @student_courses_2, @student_courses_1, @student_courses_4]
      expect(@algebra.sorted_grades_by_course).to eq(sorted)
    end
  end
end
