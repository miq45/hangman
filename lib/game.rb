class Game
  TOTAL_ERRORS = 7

  def initialize(word)
    @letters = word.chars
    @user_letters = []
  end

  def errors
    @user_letters - normalized_letters(@letters)
  end

  def errors_count
    errors.size
  end

  def errors_to_made
    TOTAL_ERRORS - errors_count
  end

  def letters_to_guess
    @letters.map { |char| @user_letters.include?(normalized_letter(char)) ? char : nil }
  end

  def play!(letter)
    if !@user_letters.include?(normalized_letter(letter))
      @user_letters << normalized_letter(letter)
    end
  end

  def lost?
    errors_to_made == 0
  end

  def won?
    (normalized_letters(@letters) - @user_letters).empty?
  end

  def over?
    lost? || won?
  end

  def word
    @letters.join
  end

  def normalized_letters(letters)
    letters.map { |letter| normalized_letter(letter) }
  end

  def normalized_letter(letter)
    case letter
    when 'Ё' then 'Е'
    when 'Й' then 'И'
    else
      letter
    end
  end
end
