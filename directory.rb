#First, we create an array of students:
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Kreuger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

#Then, we print a list of students using the print_header
#and print(names) methods.
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

#Then, we print the number of students.
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#Finally, we call each method to ensure the results
#are outputted for the end user.
print_header
print(students)
print_footer(students)