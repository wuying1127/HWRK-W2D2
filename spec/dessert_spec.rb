require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:cheesecake) { Dessert.new("cheesecake", 50, chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(cheesecake.type).to eq("cheesecake")
    end

    it "sets a quantity" do
      expect(cheesecake.quantity).to eq(50)
    end


    it "starts ingredients as an empty array" do
      expect(cheesecake.ingredients).to eq([])
    end


    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cheesecake", "no", "Mark")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cheesecake.add_ingredient("sugar")
      expect(cheesecake.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(cheesecake.mix!).to eq(cheesecake.ingredients.shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cheesecake.eat(1)).to eq(49)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect{ cheesecake.eat(51) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Mark the Great Baker")
      expect(cheesecake.serve).to eq("Chef Mark the Great Baker has made 50 cheesecakes!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cheesecake)
      cheesecake.make_more
    end
  end
end
