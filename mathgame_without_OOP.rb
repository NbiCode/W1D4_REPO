
@players = []


def game_setup
  puts "Please enter the number of players"
  number_of_players = gets.chomp.to_i
  for player_count in 1..number_of_players  
    puts "Enter the name of player number #{player_count}"
    player_name = gets.chomp
    hash_count = player_count - 1
    @players[hash_count] = {:name => player_name, :score => 0, :lives => 3}
  end
  game_start
end

def number_generator
    num1 = rand(1..20)
    num2 = rand(1..20)
    @answer = num1 + num2
  return "#{num1} and #{num2}"
end

def player_validation
  @players.select do | player_info |
    if player_info[:lives] <= 0
      puts "#{player_info[:name]} you dont have any lives left"
      puts "GAME OVER"
      final_scores
#      puts "please enter a new set of players"
#      game_setup
    else 
      game_start  
    end
  end
end  

def game_start
  @players.each do | player_info |
    puts "#{player_info[:name]} what's sum of #{number_generator}"
    user_answer = gets.chomp.to_i
    if user_answer == @answer
      then player_info[:score] = player_info[:score] + 1
    else player_info[:lives] = player_info[:lives] - 1
    end
  puts "#{player_info[:name]} : your score is #{player_info[:score]} and you have #{player_info[:lives]} lives left"
    end

   play_again
#  player_validation
end

def play_again
  puts "Do the players want to play again?"
  puts "Press Yes or No"
  play_again = gets.chomp
  if play_again.downcase == "yes"
  player_validation
  else  
    final_scores  
  end
end

def final_scores
  @players.each do | player_info |
    puts "#{player_info[:name]} ! Your final score is #{player_info[:score]}"
  end
end



game_setup
# game_start









# puts "Player 1 please enter your name?"
# player_name = gets.chomps
# @players[0][:name] = player_name



# def player1(answer)
#   if answer == @answer
#     then @player1_score = @player1_score + 1
#   else
#     @player1_lives = @player1_lives - 1
#   end
#   return "Your score is #{@player1_score} and you have #{@player1_lives} remaing"
# end





# puts number_generator
# answer =  gets.chomp.to_i
# puts player1(answer)
