class Pencil

  def initialize(length, graphite_durability, eraser_durability)
    @length = length
    @graphite_durability = graphite_durability
    @graphite_durability = @graphite_durability
    @initial_eraser_durability = eraser_durability
    @eraser_durability = @initial_eraser_durability
  end

  attr_reader :length, :graphite_durability, :eraser_durability

#All writes should go through this method
  def write(text, paper)
    graphite_durability = @graphite_durability
    if text.length <= graphite_durability
      @graphite_durability -= text.length

    else
      text = text.slice(0...graphite_durability) + " "*(text.length-graphite_durability)
      @graphite_durability = 0
    end
    paper = text
    paper
  end

  def erase(paper, erase_word)
    index = paper.rindex(erase_word)
    currentIndex = index + erase_word.length - 1
    paper_array = paper.split("")
    char = paper_array[currentIndex]
    while currentIndex >= index do
      if @eraser_durability > 1
        if char != " " && char == char.downcase
          @eraser_durability -= 1
          paper_array[currentIndex] = " "
        elsif char != " " && char != char.downcase
          @eraser_durability -= 2
          paper_array[currentIndex] = " "
        end
      elsif @eraser_durability == 1
        if char != " " && char = char.downcase
          @eraser_durability -= 1
          paper_array[currentIndex] = " "
        end
      end

      currentIndex -= 1
      char = paper_array[currentIndex]

    end
    paper = paper_array.join()
    paper
  end

  def sharpen()
    if @length > 0
      @graphite_durability = @graphite_durability
      @length -= 1
    end
  end

  def length
    @length
  end

  def graphite_durability
    @graphite_durability
  end

  def eraser_durability
    @eraser_durability
  end

end
