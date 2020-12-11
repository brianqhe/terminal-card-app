require_relative '../game'

describe 'card number' do
    it 'picks a key in a hash' do
        expect(Game.random_key({'key' => 'value'})).to eq('key')
        expect(Game.random_key({'key1' => 'value 1', 'key2' => 'value2'})).to eq('key1').or(eq('key2'))
    end
end

describe 'select suit' do
    it 'picks a suit from the array' do
        expect(Game.random_suit(["A"])).to eq("A")
        expect(Game.random_suit(["A", "B"])).to eq("A").or(eq("B"))
        expect(Game.random_suit(["♠", "♦", "♥", "♣"])).to eq("♠").or(eq("♦")).or(eq("♥")).or(eq("♣"))
    end
end
