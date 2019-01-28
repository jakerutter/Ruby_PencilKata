class Pencil
  attr_accessor :length, :durability

  def initialize(length=nil, durability=nil)
    @length = length
    @durability = durability
  end

  def defaultLength(length)
    length = length
    length
  end

  def defaultDurability(durability)
    durability = durability
    durability
  end

  def length
    length = length
    length
  end

  def durability(durability)
    durability = durability
    durability
  end

  def eraserDurability(eraser_durability)
    eraser_durability = eraser_durability
    eraser_durability
  end

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
