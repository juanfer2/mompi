require 'spec_helper'
require_relative '../../app/utils/auth_jwt'

RSpec.describe AuthJwt do
  subject { described_class }
  let(:secret_key) { ENV['SECRET_KEY'] }
  let(:hmac) { 'HS256' }
  let(:payload) { { data: 'data' } }
  let(:token) { 'tokenRandom' }

  before do
    allow(JWT).to receive(:encode).with(payload, secret_key, hmac).
      and_return(token)
    allow(JWT).to receive(:decode).with(token, secret_key, true, { algorithm: hmac }).
      and_return(payload)
  end

  describe '#generate_token' do
    it 'generates a token' do
      expect(subject.generate_token(payload)).to eq(token)
      expect(JWT).to have_received(:encode).with(payload, secret_key, hmac)
    end
  end

  describe '#decode_token' do
    it 'decodes a token' do
      expect(subject.decode_token(token)).to eq(payload)
      expect(JWT).to have_received(:decode).with(token, secret_key, true, { algorithm: hmac })
    end
  end
end
