# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'pry'
require './candidates'
# require './filters'


#********** Experience Valuation Method ************#
def experienced?(candidate)
    candidate[:years_of_experience] >= 2
end

 # puts experienced?(@candidates[0])

#********* Candidate Idendification/Find Method ***********#

def find(id)
  @candidates.select do | profile |
        if (id.to_i == profile[:id]) 
         return profile       
        end
      end   
end

puts find(5)

#*********** Qualifying Candidates Method *********#

def qualified_candidates(list_of_candidates)
    qualified_candidates = list_of_candidates.select do | profile |
         (profile[:years_of_experience] > 0) &&
         (profile[:github_points] > 100) && 
((profile[:languages].include?("Ruby")) || (profile[:languages].include?("Python"))) &&
        (profile[:date_applied] > 15.days.ago.to_date) &&
        (profile[:age] > 18)
      end
      return qualified_candidates
end


pp qualified_candidates(@candidates)

#*********** puts qualified_candidates(@candidates) *********#

def ordered_by_qualifications(list_of_candidates)
    ordered_list = list_of_candidates.sort do | x , y| 
      [y[:years_of_experience],x[:github_points]] <=> [x[:years_of_experience],y[:github_points]]     
    end
  return ordered_list
end
# puts 'CANDIDATES'
# pp ordered_by_qualifications(@candidates)
# puts '----------------------'

