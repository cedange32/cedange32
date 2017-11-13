class Recipe
  attr_reader :name, :description, :difficulty
  attr_accessor :done

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @difficulty = attributes[:difficulty]
    @done = false
  end

  def valid?
    if @name == nil || @name == ""
      return false
    elsif @description.length < 10
      return false
    elsif @difficulty < 1 || @difficulty > 5
      return false
    else
      return true
    end
  end

  def mark_as_done
    @done = true
  end
end
