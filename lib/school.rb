# code here!
require 'pry'

class School
  attr_reader :name, :roster
  def initialize(name)
    @name = name
    @roster = {}
  end

  def add_student(student, grade)
    if @roster.key?(grade)
      @roster[grade] << student
    else
      @roster[grade] = []
      @roster[grade] << student
    end
  end

  def grade(grade)
    @roster[grade]
  end

  def sort
    #return a hash in which all of the students are sorted
    #alphabetically within the arrays of the keys

    #this method (below) is good for if you don't want to mod original array

    # new_roster = {}
    # @roster.each do |grade, students|
    #   sorted_students = students.sort
    #   new_roster[grade] = sorted_students
    # end
    # return new_roster

    #this method (below) is quicker but mods array (destructive method)

    @roster.each do |grade, students|
      students.sort!
    end
  end

  def upgrade(student)
    #advance student up a grade
    #find the student in the roster
    #iterate over roster and check each grade for student
    current_grade = nil
    @roster.each do |grade, students|
      if @roster[grade].include?(student)
        current_grade = grade
      end
    end
    #remove student's name from grade student's in
    @roster[current_grade].delete_if{|i| i = student}
    #add student to the hash key for grade + 1
    add_student(student, current_grade + 1)
  end

end
