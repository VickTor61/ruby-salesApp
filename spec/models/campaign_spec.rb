require 'rails_helper'

RSpec.describe Campaign, type: :model do
  subject(:Campaign) do
    described_class.new(
      name: 'first campaign',
      message: 'This is my first campaign'
    )
  end

  describe 'validations' do
    it 'should check for name and message attribute' do
      expect(subject.attributes).to include 'name'
      expect(subject.attributes).to include 'message'
    end

    it 'should check message length is greater than 10' do
      expect(subject.message.length).to be > 10
    end

    it 'is not valid without a name and message' do
      campaign = Campaign.new(name: nil, message: nil)
      expect(campaign).to_not be_valid
    end
  end
end