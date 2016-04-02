# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'active_support/all'
require './candidates'
require './filters'

## Your test code can go here


#*********** The REPL Logic ************#

loop do
puts "Please enter command(find one, all, qualified, quit)"

p '1. Enter candidate ID to display candidate profile'
p '2. Enter <all> to profiles of all the candidates' 
p '3. Enter <qualified> to get the list of qualified candidates based on experience and GIT github_points'
p '4. Enter <order> to get a ordered list of qualified candidates'
p '5. Enter <quit> to exit'

answer = gets.chomp

   case answer
   when /1..100/
    answer = answer.to_i
   pp find(answer)
   when /all/
     pp @candidates
   when /qualified/
     pp qualified_candidates(@candidates)
   when /order/
     pp ordered_by_qualifications(@candidates)   
   when /quit/
     puts "goodbye"
     break
   end
 end


# pp find(11)



