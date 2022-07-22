require "./game.rb"
require "./numbers_creator.rb"

easy_or_hard = nil
until easy_or_hard == "E" || easy_or_hard == "H"
  puts "Easy or Hard mode? E for Easy or H for Hard. Hard could include repeating numbers in the code."
  easy_or_hard = gets.chomp.upcase
  case
  when "E"
    game = Game.new(Game.random_no_repeat)
  when "H"
    game = Game.new(Game.random_repeat)
  end
end

until game.done || game.guess_count > 11
  puts "-----------------"
  puts "Guess the code"
  puts "#{12 - game.guess_count} guesses remaining"
  game.check_numbers(gets.chomp)
end
puts "You didn't get the code. It was #{game.code_numbers}" unless game.done
