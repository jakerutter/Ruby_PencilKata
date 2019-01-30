class Pencil

  def initialize(length, durability)
    @length = length
    @durability = durability
  end

  attr_accessor :length, :durability

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

  def sharpen(current_durability)
    length = @length
    durability = @durability
    if length > 0
      length -= 1
    else
      durability = current_durability
  end
    return length, durability
end

end
