module NumbersCreator
  def random_no_repeat
    loop do
      random_array = Array.new(4) { rand(1...7) }
      break random_array if random_array.uniq.length == 4
    end
  end

  def random_repeat
    Array.new(4) { rand(1...7) }
  end
end
