require 'io/console'

class SessionView
  def ask_for(item)
    puts
    puts "Which #{item}?"
    print ">"
    if item == 'password'
      return STDIN.noecho(&:gets).chomp
    else
      return gets.chomp
    end
  end

  def wrong_credentials
    puts
    puts "Try again ..."
  end
end
