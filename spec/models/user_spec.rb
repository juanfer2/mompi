require 'spec_helper'
require_relative '../../app/models/user'

RSpec.describe User, type: :model do
  subject { described_class }
  context 'when has many relations' do
    it { should have_many(:payment_sources) }
  end

  # it 'enum definition' do 
  #   should define_enum_for(:kind).with_values([])
  # end

  # should define_enum_for(:payment_mode).with_values(
  #   [:hotel_collect,:virtual_collect, :auto_collect, :ayenda_rooms_collect, :credit_collect]
  # )

  describe 'when user is invalid' do
    it 'is not valid without a name' do
      user = subject.new(name: nil)
      expect(user).to_not be valid
    end

    it 'is not valid without a email' do
    end

    it 'is not valid without a password' do
    end

    it 'is not valid without a password_hash' do
    end
  end
end
