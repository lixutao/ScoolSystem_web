class AddStudentIdAndTeacherIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :student_id, :integer
    add_column :courses, :teacher_id, :integer
  end
end
