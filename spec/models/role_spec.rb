# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { create :role }

  context 'with field attributes' do
    it 'includes name' do
      expect(role.attributes).to include 'name'
    end

    it 'includes slug' do
      expect(role.attributes).to include 'slug'
    end
  end

  context 'with unique fields' do
    before do
      create :role
    end

    it 'not valid' do
      expect(build(:role)).not_to be_valid
    end
  end
end
