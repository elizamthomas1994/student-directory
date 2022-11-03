@students = []

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end
  
def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

#Then, we print a list of students using the print_header
#and print(names) methods.
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#Then, we print the number of students.
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

interactive_menu

=begin
1. After we added the code to load the students from file, we ended up with adding the
students to @students in two places. The lines in load_students() and input_students()
are almost the same. This violates the DRY (Don't Repeat Yourself) principle. How can 
you extract them into a method to fix this problem?



2. How could you make the program load students.csv by default if no file is given on
startup? Which methods would you need to change?



3. Continue refactoring the code. Which method is a bit too long? What method names are
not clear enough? Anything else you'd change to make your code look more elegant? Why?



4. Right now, when the user choses an option from our menu, there's no way of them 
knowing if the action was successful. Can you fix this and implement feedback 
messages for the user?



5. The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make 
the script more flexible by asking for the filename if the user chooses these menu 
items.



6. We are opening and closing the files manually. Read the documentation of the File 
class to find out how to use a code block (do...end) to access a file, so that we 
didn't have to close it explicitly (it will be closed automatically when the block 
finishes). Refactor the code to use a code block.



7. We are de-facto using CSV format to store data. However, Ruby includes a library to
work with the CSV files that we could use instead of working directly with the files. 
Refactor the code to use this library.



8. Write a short program that reads its own source code (search Stack Overflow to find
out how to get the name of the currently executed file) and prints it on the screen.


FOR STEP 8 EXERCISES PLEASE REFER TO DIRECTORY_DUPLICATE.RB
=end