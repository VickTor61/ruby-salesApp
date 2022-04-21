# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { create :role }

  describe 'validation' do
    it 'includes role attributes' do
      expect(role.attributes).to include 'name'
      expect(role.attributes).to include 'slug'
    end

    context 'should have unique fields' do # rubocop:todo RSpec/ContextWording
      before do
        create :role
      end

      it 'not valid' do
        expect(build(:role)).not_to be_valid
      end
    end
  end
end
