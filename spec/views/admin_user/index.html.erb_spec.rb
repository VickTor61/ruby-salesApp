require 'rails_helper'

RSpec.describe 'admin/users/index.html.erb', type: :view do
  let(:user_admin) { FactoryBot.create :user_role }
  let(:user) { FactoryBot.create(:user) }

  context '#{admin}index' do
    before(:each) do
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

    it 'should show links for a an admin user' do
      enable_pundit(view, user_admin.user)
      render template: "/admin/users/index.html.erb"
      expect(rendered).to include('Destroy')
      expect(rendered).to include('Edit')
    end

    it 'should not show links for regular user' do
      enable_pundit(view, user)
      render template: "/admin/users/index.html.erb"
      expect(rendered).to_not include('delete')
      expect(rendered).to_not include('Edit')
    end
  end
end