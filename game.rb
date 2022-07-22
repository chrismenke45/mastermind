require "./numbers_creator.rb"

class Game
  extend NumbersCreator
  attr_reader :code_numbers, :done, :guess_count

  def initialize(code_numbers)
    @code_numbers = code_numbers
    @done = false
    @guess_count = 0
  end

  def check_numbers(str)
    guesses = valid_code_number(string2array_code_number(str))
    @guess_count += 1
    if guesses == @code_numbers
      puts "You got the code!"
      @done = true
    elsif guesses.any? { |num| @code_numbers.include?(num) }
      correct_guesses = guesses.intersection(@code_numbers)
      correct_places = guesses.map.with_index { |guess, index| guess == @code_numbers[index] ? guess : nil }.compact
      puts "#{correct_guesses.length - correct_places.length} are the correct number, wrong place"
      puts "#{correct_places.length} are correct number, correct place"
    else
      puts "No correct guesses"
    end
  end

  private

  def valid_code_number(arr)
    until arr.length == 4 && arr.none? { |int| int <= 0 || int > 6 }
      puts "Please input a valid guess with each number seperated by a comma (Ex: 1,2,3,4). Numbers can be in the range 1 to 6."
      arr = string2array_code_number(gets.chomp)
    end
    arr
  end

  def string2array_code_number(str)
    arr = str.split(",")
    arr.map { |number| number.to_i }
  end
end
