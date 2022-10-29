require 'rails_helper'
require 'json_web_token'

RSpec.describe 'json_web_token' do
  it 'retrieves correct id after decoding' do
    user = User.create(name: 'TestUser')

    token = JsonWebToken.encode({ id: user.id })
    decoded = JsonWebToken.decode(token)
    expect(decoded[:id]).to eq user.id
  end

  it 'sets default expiration time' do
    user = User.create(name: 'TestUser')

    token = JsonWebToken.encode({ id: user.id })
    decoded = JsonWebToken.decode(token)
    expect(decoded[:exp]).to be_truthy
  end

  it 'raises error when t' do
    user = User.create(name: 'TestUser')

    token = JsonWebToken.encode({ id: user.id }, -1.hours.from_now)
    expect{ JsonWebToken.decode(token) }.to raise_error
  end
end
