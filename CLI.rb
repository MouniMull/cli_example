class CLI

  def initialize
    @learntopics = {
      'snow' => 'Snow is cold.',
      'air' => 'Air is not dense.',
      'fire' => 'Fire is hot.'
    }
  end

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
      when 'learn'
        learn
      end
    end
  end

  def greet
    puts '*** Welcome to my CLI! ***'
    puts 'Please choose an option:'
    puts
    puts 'sayhi - Say hello!'
    puts 'saygoodbye - Say goodbye!'
    puts 'learn - Choose topic to learn!'
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

  def learn
    loop do
      puts 'Choose an adventure!'
      puts
      @learntopics.keys.each do |topic|
        puts topic
      end
      print '> '
      input = get_input
      if @learntopics.has_key?(input)
        puts "WISDOM: #{@learntopics[input]}"
      else
        break
      end
    end

  end
end
