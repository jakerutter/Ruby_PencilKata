class Pencil

  def initialize(length, durability)
    @length = length
    @initial_durability = durability
    @durability = @initial_durability
  end

  attr_reader :length, :durability

#All writes should go through this method
  def write(text, paper)
    durability = @durability
    if text.length <= durability
      @durability -= text.length

    else
      text = text.slice(0...durability) + " "*(text.length-durability)
      @durability = 0
    end
    paper = text
    paper
  end

  def erase(paper, erase_word)
    index = paper.rindex(erase_word)
    a, b = paper.slice!(index, erase_word.length), paper
    b = b.gsub(/\s+/, ' ')
    paper = b
    paper
  end

  def sharpen()
    if @length > 0
      @durability = @initial_durability
      @length -= 1
    end
  end

  def length
    @length
  end

  def durability
    @durability
  end

end
