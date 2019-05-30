class Element
  include Comparable
  attr_accessor :priority , :value

  def  initialize(value, priority)
    @priority = priority
    @value = value
  end

  def <=>(other)
    priority <=> other.priority
  end

end