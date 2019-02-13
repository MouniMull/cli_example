class CLI
  def start
    loop do
      greet
      input = get_input
      case input
      when 'sayhi'
        sayhi
      when 'saygoodbye'
        saygoodbye
        break
      end
    end
  end

  def greet
    puts '*** Welcome to my CLI! ***'
    puts 'Please choose an option:'
    puts
    puts 'sayhi - Say hello!'
    puts 'saygoodbye - Say goodbye!'
    print '> '
  end

  def get_input
    gets.chomp
  end

  def sayhi
    puts "Hello!"
  end

  def saygoodbye
    puts "Goodbye!"
  end
end
