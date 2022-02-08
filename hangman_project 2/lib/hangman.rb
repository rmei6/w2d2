require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,"_")
    @attempted_chars = Array.new(0)
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    return [] if !@secret_word.include?(char)
    (0...@secret_word.length).select {|i| @secret_word[i] == char}
  end

  def fill_indices(char,indices)
    indices.each do |i| @guess_word[i] = char end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false 
    end
    @attempted_chars << char
    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1 
    else
      fill_indices(char,get_matching_indices(char))
    end
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end
    
  def win?
    #debugger
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
