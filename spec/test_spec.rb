# require_relative '../test'

# describe 'say hello world' do
#     it 'says hello' do
#         expect(hello_world()).to eq('hello world')
#     end
# end

require_relative '../test'

describe 'say hello world' do
    it 'picks a key in a hash' do
        expect(random_key({'key' => 'value'})).to eq('key')
    end
end