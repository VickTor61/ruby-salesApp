# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  subject(:Campaign) do # rubocop:todo RSpec/VariableName
    described_class.new(
      name: 'first campaign',
      message: 'This is my first campaign'
    )
  end

  describe 'validations' do
    it 'checks for name and message attribute' do
      expect(subject.attributes).to include 'name' # rubocop:todo RSpec/NamedSubject
      expect(subject.attributes).to include 'message' # rubocop:todo RSpec/NamedSubject
    end

    it 'checks message length is greater than 10' do
      expect(subject.message.length).to be > 10 # rubocop:todo RSpec/NamedSubject
    end

    it 'is not valid without a name and message' do
      campaign = described_class.new(name: nil, message: nil)
      expect(campaign).not_to be_valid
    end
  end
end
