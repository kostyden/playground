class FizzBuzz
  def initialize(iterations)
    @fizz = [nil, nil, "fizz"].cycle
    @buzz = [nil, nil, nil, nil, "buzz"].cycle
    @numbers = 1.step

    @iterations = iterations
    @enumerator = Enumerator.new { |enumerator| loop { enumerator.yield(next_word) }}
  end

  def each
    if block_given?
      words.each { |word| yield(word) }
    else
      words.each
    end
  end

  private

  def next_word
    fizz = @fizz.next
    buzz = @buzz.next
    number = @numbers.next

    word = "#{fizz}#{buzz}"
    word == "" ? number : word
  end

  def words
    @enumerator.take(@iterations)
  end
end
