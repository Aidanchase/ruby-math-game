class Question  
  attr_reader :number1, :number2, :type
  attr_accessor :check

  def create_question
    @number1 = rand(100)
    @number2 = rand(100)
    @types = ["*", "/", "+"]
    @type = @types.sample
    if @number1 < @number2
      @number2, @number1 = @number1, @number2
    end
    "What is #{@number1} #{@type} #{@number2}"
  end

  def check(guess)
    if @type == "*"
       return guess == @number1 * @number2
    end
      if @type == "/"
        return guess == @number1 / @number2
          puts @number1 / @number2
    end
    if @type == "+"
      puts @number1 + @number2
      return guess == @number1 + @number2
    end
  end
end

