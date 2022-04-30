# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/index.html.erb', type: :view do # rubocop:todo Metrics/BlockLength
  let(:user_admin) { create :user_role }
  let(:user) { create(:user) }

  context 'when admin' do # rubocop:todo Metrics/BlockLength
    before do
      @request.env['devise.mapping'] = Devise.mappings[user_admin.user]
      sign_in user_admin.user

      assign(:users, [
               User.create!(
                 email: 'user1@gmail.com',
                 password: 'username',
                 password_confirmation: 'username'
               ),
               User.create!(
                 email: 'user2@gmail.com',
                 password: 'username',
                 password_confirmation: 'username'
               )
             ])
    end

    it 'show destroy text for an admin user' do
      enable_pundit(view, user_admin.user)
      render template: '/admin/users/index.html.erb'
      expect(rendered).to include('Destroy')
    end

    it 'show Edit text for an admin user' do
      enable_pundit(view, user_admin.user)
      render template: '/admin/users/index.html.erb'
      expect(rendered).to include('Edit')
    end
  end
end
