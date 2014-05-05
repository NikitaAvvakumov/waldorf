module CreationHelpers
  def add_valid_student_info
    fill_in 'student_name', with: 'Ron Weasley'
    fill_in 'student_grade', with: 2
    fill_in 'student_about', with: "Ron's red hair---MORE--- is visible from anywhere."
  end

  def add_valid_teacher_info
    fill_in 'teacher_name', with: 'Severus Snape'
    fill_in 'teacher_email', with: 'snape@waldorf.info'
    fill_in 'teacher_subjects', with: 'Potions'
    fill_in 'teacher_bio', with: 'There will be no wand-waving!'
  end
end

RSpec.configure do |c|
  c.include CreationHelpers, type: :feature
end