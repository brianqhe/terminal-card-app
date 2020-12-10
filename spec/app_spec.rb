require_relative '../index'
# require_relative '../punishments'
# require_relative '../game'
# require_relative '../validator'

describe 'display_welcome' do
    it 'should display the welcome message' do
        expect(display_welcome()).to eq(
            "Ride the Bus!
            Welcome to this terminal app of a simple card game\n"
        )
    end
end