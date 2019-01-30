require "pencil"

describe Pencil do

  describe "#write" do
    it "Writes to an empty piece of paper" do
      blank_paper = ""
      expect(Pencil.new(5,12).write("hello world", blank_paper)).to eq("hello world")
    end
  end

  describe "write" do
    it "Pencil writes spaces after it runs out of durability" do
      text = "this is long text"
      expect(Pencil.new(5,5).write(text, "")).to eq("this             ")
    end
  end

  describe "#erase_one" do
    it "Erases the last instance of a given word from a string" do
      paper = "bubble gum bubble gum in a dish how many pieces do you wish"
      erase_word = "bubble"
      expect(Pencil.new(5,5).erase(paper, erase_word)).to eq("bubble gum gum in a dish how many pieces do you wish")
    end
  end

  describe "#erase_two" do
    it "Erases the last instance of a given word from a string" do
      paper = "bubble gum bubblegum in a dish how many pieces do you wish"
      erase_word = "bubble"
      expect(Pencil.new(5,5,).erase(paper, erase_word)).to eq("bubble gum gum in a dish how many pieces do you wish")
    end
  end

  describe "#erase_three" do
    it "Erases the last instance of a given word from a string" do
      paper = "bubble gumbubble gum in a dish how many pieces do you wish"
      erase_word = "bubble"
      expect(Pencil.new(5,5).erase(paper, erase_word)).to eq("bubble gum gum in a dish how many pieces do you wish")
    end
  end

  describe "#sharpen_one" do
    it "Returns all durability and reduces length by one" do
      current_durability = 0
      length, durability = Pencil.new(3,10).sharpen(current_durability)
      expect(length).to eq(2)
      expect(durability).to eq(10)
    end
  end

  describe "#sharpen_two" do
    it "Returns length and durability of pencil that cannot be sharpened" do
      current_durability = 5
      length, durability = Pencil.new(0,5).sharpen(current_durability)
      expect(length).to eq(0)
      expect(durability).to eq(5)
    end
  end

end
