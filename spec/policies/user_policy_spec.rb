# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:admin) { create(:user_role) }

  permissions :index? do
    # rubocop:todo RSpec/RepeatedExample
    it 'denies access to non admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).not_to permit(user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample

    # rubocop:todo RSpec/RepeatedExample
    it 'allows access to admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).to permit(admin.user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample
  end

  permissions :show? do
    # rubocop:todo RSpec/RepeatedExample
    it 'denies access to non admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).not_to permit(user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample

    # rubocop:todo RSpec/RepeatedExample
    it 'allows access to admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).to permit(admin.user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample
  end

  permissions :new? do
    # rubocop:todo RSpec/RepeatedExample
    it 'denies access to non admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).not_to permit(user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample

    # rubocop:todo RSpec/RepeatedExample
    it 'allows access to admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).to permit(admin.user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample
  end

  permissions :create? do
    # rubocop:todo RSpec/RepeatedExample
    it 'denies access to non admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).not_to permit(user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample

    # rubocop:todo RSpec/RepeatedExample
    it 'allows access to admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).to permit(admin.user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample
  end

  permissions :edit? do
    # rubocop:todo RSpec/RepeatedExample
    it 'denies access to non admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).not_to permit(user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample

    # rubocop:todo RSpec/RepeatedExample
    it 'allows access to admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).to permit(admin.user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample
  end

  permissions :update? do
    # rubocop:todo RSpec/RepeatedExample
    it 'denies access to non admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).not_to permit(user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample

    # rubocop:todo RSpec/RepeatedExample
    it 'allows access to admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).to permit(admin.user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample
  end

  permissions :destroy? do
    # rubocop:todo RSpec/RepeatedExample
    it 'denies access to non admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).not_to permit(user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample

    # rubocop:todo RSpec/RepeatedExample
    it 'allows access to admin users' do # rubocop:todo RSpec/RepeatedDescription, RSpec/RepeatedExample
      expect(subject).to permit(admin.user) # rubocop:todo RSpec/NamedSubject
    end
    # rubocop:enable RSpec/RepeatedExample
  end
end
