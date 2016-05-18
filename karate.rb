class BinarySearch

  # arguments provide the number of integers in the array and the range of the random numbers
  def initialize (number_of_random_numbers, upper_limit)
    @number_of_random_numbers = number_of_random_numbers
    @upper_limit = upper_limit
    @arr = []
    @target = rand(1..@upper_limit)
  end

  def generate_random_numbers
    until (@arr.length == @number_of_random_numbers) do
      selection = rand(1..@upper_limit)
      if @arr.include?(selection)
        selection = rand(1..@upper_limit)
      else
        @arr << selection
        selection = rand(1..@upper_limit)
      end
    end
    @arr.sort!
    puts "\nThe target number is #{@target}.\n\n"
    puts "The array in which the target will be search is #{@arr}.\n\n"
  end

  def guess_target
    guess = @arr[((@arr.length)/2)]
    @i=1
    until guess == @target || @arr.length == 1
      if guess < @target && @arr.length.even? 
        @arr = @arr.last((@arr.length-1) - @arr.index(guess))
      elsif guess < @target && @arr.length.odd?
        @arr = @arr.last((@arr.length-1) - @arr.index(guess))
      elsif guess > @target && @arr.length.even?
        @arr = @arr.first((@arr.length) - @arr.index(guess))
      else guess > @target && @arr.length.odd?
        @arr = @arr.first((@arr.length-1) - @arr.index(guess))
      end
      guess = @arr[((@arr.length)/2)]
      @i+=1
    end
    if guess != @target
      guess = -1
    end
    return guess
  end

  def show_results(x)
    if x == -1
      puts "The target number is not in the array.  This was determined after #{@i} iteration(s)."
    else
      puts "The target #{x} was determined in #{@i} guess(es)."
    end
  end

end

bsearch1 = BinarySearch.new(7, 14)
bsearch1.generate_random_numbers
x=bsearch1.guess_target
bsearch1.show_results(x)
        