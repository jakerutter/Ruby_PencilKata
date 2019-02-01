require "pencil"

describe Pencil do

  describe "#write" do
    it "Writes to an empty piece of paper" do
      blank_paper = ""
      expect(Pencil.new(5,12,5).write("hello world", blank_paper)).to eq("hello world")
    end
  end

  describe "write" do
    it "Pencil writes spaces after it runs out of graphite_durability" do
      text = "this is long text"
      expect(Pencil.new(5,5,5).write(text, "")).to eq("this             ")
    end
  end

  describe "#sharpen" do
    it "Returns all graphite durability and reduces length by one" do
      pencil = Pencil.new(3,10,5)
      pencil.sharpen()
      expect(pencil.length).to eq(2)
      expect(pencil.graphite_durability).to eq(10)
  end

    it "Returns length and graphite durability of pencil that cannot be sharpened" do
      pencil = Pencil.new(0,5,5)
      pencil.sharpen()
      expect(pencil.length).to eq(0)
      expect(pencil.graphite_durability).to eq(5)
    end
  end

  describe "#erase" do
    it "Erases the last instance of a given word from a string" do
      pencil = Pencil.new(5,5,10)
      paper = "bubble gum bubble gum in a dish how many pieces do you wish"
      erase_word = "pieces"
      expect(pencil.erase(paper, erase_word)).to eq("bubble gum bubble gum in a dish how many do you wish")
    end

    it "Erases the last instance of a given word from a string" do
      pencil = Pencil.new(5,5,10)
      paper = "there were two kittens playing on the couch"
      erase_word = "two kittens"
      expect(pencil.erase(paper, erase_word)).to eq("there were playing on the couch")
    end

    it "Eraser lacks durability to erase all of a word" do
      pencil = Pencil.new(5,5,5)
      paper = "two score and seven years ago"
      erase_word = "seven years ago"
      expect(Pencil.new(5,5,5).erase(paper, erase_word)).to eq("two score and ")
    end
  end


end
