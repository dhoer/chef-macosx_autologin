require 'spec_helper'

describe 'kcpassword_xor' do
  it 'returns encrypted password' do
    password = 'vagrant'
    expect(kcpassword_xor(password)).to eq('^Kè5Q³Ò©êÄ^?v^N')
  end
end
