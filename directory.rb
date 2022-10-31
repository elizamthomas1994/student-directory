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
#Then, we print the list of students:
students.each do |student|
  puts student
end
#Finally, we print the total number of students
print "Overall, we have #{students.count} great students"