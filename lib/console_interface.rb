class ConsoleInterface
  FIGURES =
      Dir["#{__dir__}/../data/figures/*.txt"]
      .sort
      .map { |p| File.read(p) }

  def initialize(game)
    @game = game
  end

  def print_state
    puts <<~END
      Слово: #{word_to_show}
      #{figure}
      Ошибки (#{@game.errors_count}): #{errors_to_show}
      У вас осталось ошибок: #{@game.errors_to_made}

    END

    if @game.lost?
      puts "Вы проиграли! Загаданное слово: #{@game.word}"
    elsif @game.won?
      puts 'Вы выйграли!'
    end
  end

  def word_to_show
    @game.letters_to_guess.map { |letter| letter.nil? ? '_' : letter }
        .join(' ')
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def figure
    FIGURES[@game.errors_count]
  end

  def get_word
    print 'Введите букву: '
    STDIN.gets[0].upcase
  end
end
