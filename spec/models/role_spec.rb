# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { FactoryBot.create :role }

  describe 'validation' do
    it 'should include role attributes' do
      expect(role.attributes).to include 'name'
      expect(role.attributes).to include 'slug'
    end

    context 'should have unique fields' do
      before do
        FactoryBot.create :role
      end
      it 'not valid ' do
        expect(FactoryBot.build(:role)).to_not be_valid
      end
    end
  end
end
