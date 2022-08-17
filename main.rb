require_relative "lib/game"
require_relative "lib/console_interface"

# Поприветствовать пользователя
puts 'Здравствуйте, Игрок!'

word = File.readlines("#{__dir__}/data/words.txt", chomp: true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

# Пока идет игра:
until game.over?
#   Вывести состояние
  console_interface.print_state
#   Спросить слово
  letter = console_interface.get_word
  game.play!(letter)
end

# Вывести состояние
console_interface.print_state
