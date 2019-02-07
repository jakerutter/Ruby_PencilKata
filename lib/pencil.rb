class Pencil

  def initialize(length, graphite_durability, eraser_durability)
    @length = length
    @graphite_durability = graphite_durability
    @graphite_durability = @graphite_durability
    @initial_eraser_durability = eraser_durability
    @eraser_durability = @initial_eraser_durability
  end

  attr_reader :length, :graphite_durability, :eraser_durability

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

      while currentIndex >= index do
        erase_char(paper_array, currentIndex)
        currentIndex -= 1

        if @eraser_durability == 0
          break
        end
      end

      paper = paper_array.join()
      paper
    end

  def char_cost(char)
    cost = 0
    if char == " "
      cost = cost
    elsif char == char.downcase
      cost = 1
    else
      cost = 2
    end
    cost
  end

  def erase_char(paper_array, currentIndex)
    cost = char_cost(paper_array[currentIndex])
    paper_array[currentIndex] = " "
    @eraser_durability -= cost
    paper_array
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
