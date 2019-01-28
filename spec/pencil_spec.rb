require "pencil"

describe Pencil do

  describe "#default_length" do
    it "Created with default length" do
      default_length = 5
      length = Pencil.new.default_length(default_length)
      expect(length).to eq(5)
    end
  end

  describe "#default_durability" do
    it "Created with default durability" do
      default_durability = 10
      durability = Pencil.new.default_durability(default_durability)
      expect(durability).to eq(10)
    end
  end

  describe "#write" do
    it "Writes to an empty piece of paper" do
      blank_paper = ""
      paper = Pencil.new.write("hello world", blank_paper)
      expect(paper).to eq("hello world")
    end
  end

  describe "#erase_one" do
    it "Erases the last instance of a given word from a string" do
      phrase = "bubble gum bubble gum in a dish how many pieces do you wish"
      erase_word = "bubble"
      phrase = Pencil.new.erase(phrase, erase_word)
      expect(phrase).to eq("bubble gum gum in a dish how many pieces do you wish")
    end
  end

  describe "#erase_two" do
    it "Erases the last instance of a given word from a string" do
      phrase = "bubble gum bubblegum in a dish how many pieces do you wish"
      erase_word = "bubble"
      phrase = Pencil.new.erase(phrase, erase_word)
      expect(phrase).to eq("bubble gum gum in a dish how many pieces do you wish")
    end
  end

  describe "#erase_three" do
    it "Erases the last instance of a given word from a string" do
      phrase = "bubble gumbubble gum in a dish how many pieces do you wish"
      erase_word = "bubble"
      phrase = Pencil.new.erase(phrase, erase_word)
      expect(phrase).to eq("bubble gum gum in a dish how many pieces do you wish")
    end
  end

  describe "#sharpen_one" do
    it "Returns all durability and reduces length by one" do
      current_durability = 0
      default_durability = 10
      length = 3
      length, durability = Pencil.new.sharpen(length, default_durability, current_durability)
      expect(length).to eq(2)
      expect(durability).to eq(10)
    end
  end

  describe "#sharpen_two" do
    it "Returns length and durability of pencil that cannot be sharpened" do
      current_durability = 5
      default_durability = 10
      length = 0
      length, durability = Pencil.new.sharpen(length, default_durability, current_durability)
      expect(length).to eq(0)
      expect(durability).to eq(5)
    end
  end

  describe "#eraser" do
    it "Created with default eraser durability" do
      default_eraser_durability = 5
      eraser_durability = Pencil.new.eraser_durability(default_eraser_durability)
      expect(eraser_durability).to eq(5)
    end
  end

  describe "#durability_loss_one" do
    it "Pencil loses durability as it writes" do
      durability = 5
      text = "fun"
      durability_remaining = Pencil.new.write_text_reduce_pencil_durability(durability, text)
      expect(durability_remaining).to eq(2)
    end
  end

  describe "#durability_loss_two" do
    it "Pencil loses durability as it writes" do
      durability = 5
      text = "this is long text"
      durability_remaining = Pencil.new.write_text_reduce_pencil_durability(durability, text)
      expect(durability_remaining).to eq(0)
    end
  end


  describe "write" do
    it "Pencil writes spaces after it runs out of durability" do
      durability = 5
      text = "this is long text"
      pencil = Pencil.new(5)
      expect(pencil.write(text, "")).to eq("this             ")
    end
  end
end
