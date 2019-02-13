require 'JSON'
require 'pry'
require 'rest-client'

class CLI

  def initialize
    @learntopics = {
      'snow' => 'Snow is cold.',
      'air' => 'Air is not dense.',
      'fire' => 'Fire is hot.'
    }
    @api_url = "https://jsonplaceholder.typicode.com"
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
      when 'userposts'
        user_posts
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
    puts "userposts - Get information about a user's posts!"
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

  def get_data(url)
    results = RestClient.get(url)
    JSON.parse(results)
  end

  def user_posts
    users = get_data("#{@api_url}/users")
    users = users.first(5)
    loop do
      puts 'Choose a user!'
      puts
      users.each do |user|
        puts user["name"]
      end
      print '> '
      username = get_input
      user = users.find { |user| user["name"] == username }
      if user
        show_user_titles(user)
      else
        break
      end
    end
  end

  def show_user_titles(user)
    titles = get_data("#{@api_url}/posts?userId=#{user["id"]}")
    titles = titles.first(5)
    puts "Titles by #{user["name"]}:"
    puts
    titles.each do |title|
      puts title["title"]
    end
  end
end
