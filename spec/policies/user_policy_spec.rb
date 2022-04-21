# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user_role) }
  subject { described_class }

  permissions :index? do
    it 'denies access to non admin users' do
      expect(subject).not_to permit(user)
    end
    it 'allows access to admin users' do
      expect(subject).to permit(admin.user)
    end
  end

  permissions :show? do
    it 'denies access to non admin users' do
      expect(subject).not_to permit(user)
    end
    it 'allows access to admin users' do
      expect(subject).to permit(admin.user)
    end
  end

  permissions :new? do
    it 'denies access to non admin users' do
      expect(subject).not_to permit(user)
    end
    it 'allows access to admin users' do
      expect(subject).to permit(admin.user)
    end
  end

  permissions :create? do
    it 'denies access to non admin users' do
      expect(subject).not_to permit(user)
    end
    it 'allows access to admin users' do
      expect(subject).to permit(admin.user)
    end
  end

  permissions :edit? do
    it 'denies access to non admin users' do
      expect(subject).not_to permit(user)
    end
    it 'allows access to admin users' do
      expect(subject).to permit(admin.user)
    end
  end

  permissions :update? do
    it 'denies access to non admin users' do
      expect(subject).not_to permit(user)
    end
    it 'allows access to admin users' do
      expect(subject).to permit(admin.user)
    end
  end

  permissions :destroy? do
    it 'denies access to non admin users' do
      expect(subject).not_to permit(user)
    end
    it 'allows access to admin users' do
      expect(subject).to permit(admin.user)
    end
  end
end
