require 'rails_helper'

RSpec.describe 'Student Show Page', type: :feature do
  before :each do
    @sam = Student.create!(name: 'Sam')

    @algebra = Course.create!(name: 'Algebra')
    @spanish = Course.create!(name: 'Spanish')
    @history = Course.create!(name: 'History')

    @student_courses_1 = @algebra.student_courses.create!(student_id: @sam.id, grade: 3.0)
    @student_courses_2 = @spanish.student_courses.create!(student_id: @sam.id, grade: 2.5)
    @student_courses_3 = @history.student_courses.create!(student_id: @sam.id, grade: 3.5)
  end

  describe 'As a user' do
    it 'when I visit a student show page I see their details
        - name
        - courses
        - grade for each course' do
      visit "/students/#{@sam.id}"

      expect(current_path).to eq(student_path(@sam.id))
      expect(page).to have_content(@sam.name)

      within "#course-#{@student_courses_1.course_id}" do
        expect(page).to have_content(@student_courses_1.course.name)
        expect(page).to have_content(@student_courses_1.grade)
      end

      within "#course-#{@student_courses_2.course_id}" do
        expect(page).to have_content(@student_courses_2.course.name)
        expect(page).to have_content(@student_courses_2.grade)
      end

      within "#course-#{@student_courses_3.course_id}" do
        expect(page).to have_content(@student_courses_3.course.name)
        expect(page).to have_content(@student_courses_3.grade)
      end
    end
  end
end


# User Story 1, Student Show Page
# As a user,
# When I visit a student show page
# Then I see
# - the student's name
# - the name of each course the student is enrolled in
# - the student's grade for each course
