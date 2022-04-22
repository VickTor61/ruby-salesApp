# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject(:user_policy) { described_class }

  let(:admin) { create(:user_role) }

  permissions :index?, :show?, :new?, :create?, :edit?, :update?, :destroy? do
    it 'permits admin user' do
      expect(user_policy).to permit(admin.user)
    end
  end
end
