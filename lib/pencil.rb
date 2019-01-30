class Pencil
  attr_accessor :length, :durability

  def initialize(length=nil, durability=nil)
    @length = length
    @durability = durability
  end

# Does this really give it a default length though?  This method seems superfluous
  def default_length(length)
    length = length
    length
  end

#Same as above
  def default_durability(durability)
    durability = durability
    durability
  end

# Same as above
  def eraser_durability(eraser_durability)
    eraser_durability = eraser_durability
    eraser_durability
  end

#All writes should go through this method
  def write(text, paper)
    paper = text
    paper
  end

  def erase(phrase, erase_word)
    index = phrase.rindex(erase_word)
    a, b = phrase.slice!(index, erase_word.length), phrase
    b = b.gsub(/\s+/, ' ')
    phrase = b
    phrase
  end

  def sharpen(length, default_durability, current_durability)
    if length > 0
      durability = default_durability
      length -= 1
    else
      durability = current_durability
  end
    return length, durability
end

#Should be able to refactor this method to be write(paper,text) and use @durability as a property instead of passing it in
  def write_text_reduce_pencil_durability(durability, text)
    if text.length <= durability
      write(text, "")
      durability -= text.length

    else
      text = text.slice(0...durability)
      write(text, "")
      durability = 0
    end
      durability
  end

end
