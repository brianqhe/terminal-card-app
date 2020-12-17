require_relative '../model/game'

# Rspec test to ensure a random card is picked from its corresponding value
describe 'card number' do
    it 'picks a key in a hash' do
        expect(Game.random_key({'key' => 'value'})).to eq('key')
        expect(Game.random_key({'key1' => 'value 1', 'key2' => 'value2'})).to eq('key1').or(eq('key2'))
    end
end

# Rspec test to make sure a random suit is picked correctly
describe 'select suit' do
    it 'picks a suit from the array' do
        expect(Game.random_suit(["A"])).to eq("A")
        expect(Game.random_suit(["A", "B"])).to eq("A").or(eq("B"))
        expect(Game.random_suit(["♠", "♦", "♥", "♣"])).to eq("♠").or(eq("♦")).or(eq("♥")).or(eq("♣"))
    end
end