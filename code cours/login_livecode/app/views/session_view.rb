class SessionView
  def ask_for(item)
    puts
    puts "Which #{item}?"
    print ">"
    return gets.chomp
  end

  def wrong_credentials
    puts
    puts "Try again ..."
  end
end
