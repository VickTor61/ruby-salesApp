# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/users/index.html.erb', type: :view do
  let(:user_admin) { create :user_role }
  let(:user) { create(:user) }

  context "#{admin}index" do
    before do
      @request.env['devise.mapping'] = Devise.mappings[user_admin.user] # rubocop:todo RSpec/InstanceVariable
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

    it 'shows links for a an admin user' do
      enable_pundit(view, user_admin.user)
      render template: '/admin/users/index.html.erb'
      expect(rendered).to include('Destroy')
      expect(rendered).to include('Edit')
    end

    it 'does not show links for regular user' do
      enable_pundit(view, user)
      render template: '/admin/users/index.html.erb'
      expect(rendered).not_to include('delete')
      expect(rendered).not_to include('Edit')
    end
  end
end
