def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)

=begin
STEP 8 EXERCISES

Q1) We're using the each() method to iterate over an array of students. How can you
modify the program to print a number before the name of each student, e.g. 
"1. Dr Hannibal Lecter"?

def print(students)
  students.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

=> Expected output when passed Michael Myers and Jason Voorhees:
The students of Villains Academy
--------------
1. Michael Myers (november cohort)
2. Jason Voorhees (november cohort)
Overall, we have 2 great students

Q2) Modify your program to only print the students whose name begins with a 
specific letter.

def print(students)
  students.each do |student|
    if "#{student[:name]}".start_with?('M')
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

=> Expected output when passed Michael Myers and Jason Voorhees:
The students of Villains Academy
--------------
Michael Myers (november cohort)
Overall, we have 2 great students

Q3) Modify your program to only print the students whose name is shorter 
than 12 characters.

def print(students)
  students.each do |student|
    if "#{student[:name]}".length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

=> Expected output when passed Jason Voorhees, Bane and The Joker:
The students of Villains Academy
--------------
Bane (november cohort)
The Joker (november cohort)
Overall, we have 3 great students

Q4) Rewrite the each() method that prints all students using while or until control
flow methods.

def print(students)
  n = 0
  while n < students.length
    puts "#{students[n][:name]} (#{students[n][:cohort]} cohort)"
    n += 1
  end
end

=> Expected output when passed Michael Myers and Jason Voorhees:
The students of Villains Academy
--------------
Michael Myers (november cohort)
Jason Voorhees (november cohort)
Overall, we have 2 great students

Q5) Our code only works with the student name and cohort. Add more information:
hobbies, country of birth, height, etc.

students << {name: name, cohort: :november, origin: :USA, hobby: :yoga, height: :two_metres}
.....
def print(students)
  students.each do |student|
    puts "#{student[:name]} from #{student[:origin]}, #{student[:height]} tall and likes #{student[:hobby]}. (#{student[:cohort]} cohort)"
  end
end

=> Expected output when passed Michael Myers and Jason Voorhees:
The students of Villains Academy
-------------
Michael Myers from USA, two_metres tall and likes yoga. (november cohort)
Jason Voorhees from USA, two_metres tall and likes yoga. (november cohort)
Overall, we have 2 great students

Q6) Research how the method center() of the String class works. Use it in your code
to make the output beatifully aligned.

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end
  
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end
  
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(52)
end

=> Expected output when passing through Michael Myers:
Please enter the name of the students
To finish, just hit return twice
Michael Myers
Now we have 1 students

         The students of Villains Academy         
                  -------------                   
         Michael Myers (november cohort)          
         Overall, we have 1 great students  

Q7) In the input_students method the cohort value is hard-coded. How can you ask for
both the name and the cohort? What if one of the values is empty? Can you supply
a default value? The input will be given to you as a string? How will you convert
it into a symbol? What if the user makes a typo?

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "Please enter the cohort for this student"
  cohort = gets.chomp
  while !name.empty? && !cohort.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    puts "Please enter the cohort for this student"
    cohort = gets.chomp
  end
  students
end

=> Expected output when passing through Michael Myers and Jason Voorhees as names, and November
and April as cohorts:
The students of Villains Academy
-------------
Michael Myers (November cohort)
Jason Voorhees (April cohort)
Overall, we have 2 great students

Q8) Once you complete the previous exercise, change the way the users are displayed:
print them grouped by cohorts. To do this, you'll need to get a list of all existing
cohorts, iterate over it and only print the students from that cohort.

def print(students)
  group_by_cohort = []

  students.each do |student|
    group_by_cohort.push(student[:cohort]).uniq!
  end

  group_by_cohort.each do |cohort|
    cohort_of_students = []
    students.each do |student|
      if student[:cohort] == cohort
        cohort_of_students.push(student[:name])
      end
    end
    puts cohort
    puts cohort_of_students
  end
end

Q9) Right now if we have only one student, the user will see a message "Now we have
1 students", whereas it should be "Now we have 1 student". How can you fix it so
that it uses the singular form when appropriate and plural form otherwise?

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else 
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp
  end
  students
end

=> Expected output when passing Michael Myers and Jason Voorhees:
Please enter the name of the students
To finish, just hit return twice
Michael Myers
Now we have 1 student
Jason Voorhees
Now we have 2 students

Q10) We've been using the chomp() method to get rid of the last return character.
Find another method among those provided by the String class that could be used for
the same purpose (although it requires passing some arguments)

Instead of using the chomp() method to get rid of the last return character, we can instead use
the gsub() method. Firstly, we can remove the last return character by passing "\n" through as the
first argument. Then, we pass through an empty string "" as the second argument. So, in essence, we
are replacing the last return character with nothing.

Q11) Find all typos in the "Corrections_Exercise" file and correct them. Use your 
experience, online documentation, etc. to find all the mistakes. Run the script in 
the terminal from time to time to make sure it works as it should. Google the errors 
Ruby gives you, think about what they could mean, try different things but don't 
look the answer up.

Please refer to the "Corrections_Exercise" document

Q12) What happens if the user doesn't enter any students? It will try to print
an empty list. How can you use an if statement to only print the list if there is
at least one student there?

At the end of our "input_students" method we can write the following in place of "students":
if students.length == 0 
  input_students
else 
  students
end
This way, if there are no students to print the program will simply loop back around to repeating
the input_students method. However, if there are any students to be listed, the program will
proceed as normal.

FOR STEP 10 EXERCISES PLEASE REFER TO DIRECTORY.RB
=end