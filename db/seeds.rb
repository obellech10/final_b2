# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StudentCourse.destroy_all
Student.destroy_all
Course.destroy_all

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
