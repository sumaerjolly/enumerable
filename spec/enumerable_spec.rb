require "./enumerable-methods.rb"

RSpec.describe Enumerable do
    let(:array) { [1,2,3,4] }
    let(:array1) { ["Ruby", "Javascript", "Python","Javascript"] }
    let(:hash) { {a:"Google", b:"Apple", c:"Facebook"} }
    let(:hash2) { { "a" => 100, "b" => 200, "c" => 300 } }
    let(:block) { proc {|x| x} }

    
    describe "#my_each" do
        it "Iterates through each element of an array" do
            expect(array.my_each {|n| n}).to eql(array)
        end
        it "Iterates through each key and value of a hash" do
            expect(hash.my_each {|key,value| key}).to eql(hash)
        end
        it "iterates through the array when you pass a block also" do
            expect(array.my_each {block}).to eql(array)
        end
    
    end

    describe "#my_each_with_index" do
        it "passes the index of each element of an array" do
            expect(array.my_each_with_index {|index| index}).to eql(0...4) 
        end
    end 

    describe "#my_select" do
        it "Returns a new array containing all elements of array on which its called which pass the block test." do
            expect(array.my_select {|num| num.even?}).to eql ([2,4]) 
        end

        it "Returns a new hash containing all elements of hash on which its called which pass the block test." do
            expect(hash2.my_select{|key,value| key > "a" }).to eql ({"b" => 200, "c" => 300})
        end
    end
     
    describe "#my_all?" do
        it "returns 'true' on an empty array " do
            expect([].my_all?).to eql(true)
        end
        it "returns 'false' when an 1 element evaluates to 'false' based on the block passed in." do
            expect(array.my_all? { |n| n > 100}).to eql(false)
        end
    end

    describe "#my_any?" do
        it "returns any element within the array" do
            expect([].my_any?).to eql(false)
        end
        it "returns 'true' any element that passes the block of code" do
            expect(array.my_any? {|x| x > 0}).to eql(true)
        end
    end

    describe "#my_map" do
        it "it creates a new array base on previous array using the bloc of code" do
            expect(array.my_map {|x| x >= 2}).to eql([2,3,4])
        end

    end

end
