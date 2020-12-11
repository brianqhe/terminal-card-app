# require_relative '../punishments'

# describe 'punishment' do
#     it 'should select a random punishment from the array' do
#         expect(Punishments.random_punishment(['do 10 pushups']).to eq("do 10 pushups"))
#     end
# end

require_relative '../validator'

describe 'validates' do
    it 'checks if input is valid' do
        expect(Validator.validate_input("1")).to eq(true)
        expect(Validator.validate_input("2")).to eq(true)
        expect(Validator.validate_input("3")).to eq(true)
        expect(Validator.validate_input("4")).to eq(true)
        expect(Validator.validate_input("5")).to eq(true)
        expect(Validator.validate_input("6")).to eq(false)
        expect(Validator.validate_input("7")).to eq(false)
        expect(Validator.validate_input("8")).to eq(false)
        expect(Validator.validate_input("9")).to eq(false)
        expect(Validator.validate_input("abc")).to eq(false)
        expect(Validator.validate_input("a2c4")).to eq(false)
        expect(Validator.validate_input("")).to eq(false)
    end
end

