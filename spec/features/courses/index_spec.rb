require 'rails_helper'

RSpec.describe 'Course Index Page', type: :feature do
  before :each do
    @sam = Student.create!(name: 'Sam')
    @diane = Student.create!(name: 'Diane')
    @woody = Student.create!(name: 'Woody')
    @norm = Student.create!(name: 'Norm')

    @algebra = Course.create!(name: 'Algebra')
    @spanish = Course.create!(name: 'Spanish')
    @history = Course.create!(name: 'History')

    @student_courses_1 = @algebra.student_courses.create!(student_id: @sam.id, grade: 3.0)
    @student_courses_2 = @spanish.student_courses.create!(student_id: @sam.id, grade: 2.5)
    @student_courses_3 = @history.student_courses.create!(student_id: @sam.id, grade: 3.5)

    @student_courses_4 = @algebra.student_courses.create!(student_id: @diane.id, grade: 3.4)
    @student_courses_5 = @spanish.student_courses.create!(student_id: @diane.id, grade: 3.5)
    @student_courses_6 = @history.student_courses.create!(student_id: @diane.id, grade: 2.0)

    @student_courses_7 = @algebra.student_courses.create!(student_id: @woody.id, grade: 3.5)
    @student_courses_8 = @spanish.student_courses.create!(student_id: @woody.id, grade: 1.5)
    @student_courses_9 = @history.student_courses.create!(student_id: @woody.id, grade: 2.5)

    @student_courses_10 = @algebra.student_courses.create!(student_id: @norm.id, grade: 2.5)
    @student_courses_11 = @spanish.student_courses.create!(student_id: @norm.id, grade: 2.0)
    @student_courses_12 = @history.student_courses.create!(student_id: @norm.id, grade: 4.0)
  end

  describe 'As a user' do
    it 'When I visit the course index page, I see
        - course name
        - each student listed in order from highest to lowest grade' do

      visit '/courses'

      expect(current_path).to eq(courses_path)

      within "#course-#{@algebra.id}" do
        expect(page).to have_content(@algebra.name)

        expect(page.all('li')[0]).to have_content(@woody.name)
        expect(page.all('li')[1]).to have_content(@diane.name)
        expect(page.all('li')[2]).to have_content(@sam.name)
        expect(page.all('li')[3]).to have_content(@norm.name)
      end

      within "#course-#{@spanish.id}" do
        expect(page).to have_content(@spanish.name)

        expect(page.all('li')[0]).to have_content(@diane.name)
        expect(page.all('li')[1]).to have_content(@sam.name)
        expect(page.all('li')[2]).to have_content(@norm.name)
        expect(page.all('li')[3]).to have_content(@woody.name)
      end

      within "#course-#{@history.id}" do
        expect(page).to have_content(@history.name)

        expect(page.all('li')[0]).to have_content(@norm.name)
        expect(page.all('li')[1]).to have_content(@sam.name)
        expect(page.all('li')[2]).to have_content(@woody.name)
        expect(page.all('li')[3]).to have_content(@diane.name)
      end
    end
  end
end
