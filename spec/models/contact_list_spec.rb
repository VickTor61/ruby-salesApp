# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactList, type: :model do
  let(:user) { create :user, email: 'newusermail@gmail.com' }
  let(:contact_campaign) { create(:campaign, user: user) }
  let(:contact_list) { create(:contact_list, campaign: contact_campaign, user: user) }

  context 'when valid' do
    it 'has a name attribute' do
      expect(contact_list.attributes).to include 'name'
    end

    it 'has a slug attribute' do
      expect(contact_list.attributes).to include 'slug'
    end
  end
end
