#First, we create an array of students:
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

#Then, we print a list of students using the print_header
#and print(names) methods.
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#Then, we print the number of students.
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#Finally, we call each method to ensure the results
#are outputted for the end user.
students = input_students
print_header
print(students)
print_footer(students)