class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def initialize(word)
    @word = word.strip.downcase
    @guesses = ""
    @wrong_guesses = ""
  end
  
  def word_with_guesses()
    result = ""
    
    @word.chars do |letter|
      if @guesses.include?letter
        result += letter
      else
        result += '-'
      end
    end  
    
    return result
  end
  
  def check_win_or_lose()
    result = :win
    
    if(@wrong_guesses.length >= 7)
      result = :lose
    else
      @word.chars do |letter|
        if !(@guesses.include?letter)
          result = :play
        end
      end  
    end
    
    return result
  end
  
  def guess(guess)
    raise ArgumentError, 'Argument is not numeric' if !(guess.is_a? String) || (guess.downcase =~ /^[0-9a-z]+$/).nil? 
    
    guess_cleaned = guess.strip.downcase
    valid = true
    
    if @word.include? guess_cleaned
      if !(@guesses.include? guess_cleaned)
        @guesses += guess_cleaned
      else
        valid = false
      end
    else
      if !(@wrong_guesses.include? guess_cleaned)
        @wrong_guesses += guess_cleaned
      else
        valid = false
      end
    end
    
    return valid
  end
  
  def self.get_random_word
    
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
    
  end

end
