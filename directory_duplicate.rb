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

Q2) Modify your program to only print the students whose name begins with a 
specific letter.



Q3) Modify your program to only print the students whose name is shorter 
than 12 characters.



Q4) Rewrite the each() method that prints all students using while or until control
flow methods.



Q5) Our code only works with the student name and cohort. Add more information:
hobbies, country of birth, height, etc.



Q6) Research how the method center() of the String class works. Use it in your code
to make the output beatifully aligned.



Q7) In the input_students method the cohort value is hard-coded. How can you ask for
both the name and the cohort? What if one of the values is empty? Can you supply
a default value? The input will be given to you as a string? How will you convert
it into a symbol? What if the user makes a typo?



Q8) Once you complete the previous exercise, change the way the users are displayed:
orint them grouped by cohorts. To do this, you'll need to get a list of all existing
cohorts, iterate over it and only print the students from that cohort.



Q9) Right now if we have only one student, the user will see a message "Now we have
1 students", whereas it should be "Now we have 1 student". How can you fix it so
that it uses the singular form when appropriate and plural form otherwise?



Q10) We've been using the chomp() method to get rid of the last return character.
Find another method among those provided by the String class that could be used for
the same purpose (although it requires passing some arguments)



Q11) Find all typos in the "Corrections_Exercise" file and correct them. Use your 
experience, online documentation, etc. to find all the mistakes. Run the script in 
the terminal from time to time to make sure it works as it should. Google the errors 
Ruby gives you, think about what they could mean, try different things but don't 
look the answer up.

Please refer to "Corrections_Exercise" document

Q12) What happens if the user doesn't enter any students? It will try to print
an empty list. How can you use an if statement to only print the list if there is
at least one student there?



FOR STEP 10 EXERCISES PLEASE REFER TO DIRECTORY.RB
=end