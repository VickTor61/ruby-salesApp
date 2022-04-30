# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do # rubocop:todo Metrics/BlockLength
  let(:user_admin) { create :user_role }
  let(:user) { create(:user) }

  context 'when admin' do # rubocop:todo Metrics/BlockLength
    before do
      @request.env['devise.mapping'] = Devise.mappings[user_admin.user]
      sign_in user_admin.user
    end

    describe '#index' do
      it 'renders the index page to admin user' do
        get :index
        expect(response).to render_template('index')
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#show' do
      it 'renders the show page to admin user' do
        get :show, params: { id: user_admin.user.id }
        expect(response).to render_template('show')
      end
    end

    describe '#new' do
      it 'renders new user page' do
        get :new
        expect(response).to render_template('new')
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    describe '#create' do
      it 'creates a new user' do
        expect do
          post :create,
               params: { user: { email: 'newemail@gmail.com', password: 'username',
                                 password_confirmation: 'username' } }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the new user path' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(admin_users_path)
      end
    end

    describe '#edit' do
      it 'edit the user attributes' do
        put :update, params: { id: User.first.id, user: attributes_for(:user, email: 'testemail@gmail.com') }
        expect(User.first.email).to eq('testemail@gmail.com')
      end
    end

    describe '#destroy' do
      it 'deletes a user' do
        delete :destroy, params: { id: user.id }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to admin_users_path
      end
    end
  end

  context 'when regular user' do # rubocop:todo Metrics/BlockLength
    before do
      @request.env['devise.mapping'] = Devise.mappings[user]
      sign_in user
    end

    describe '#index' do
      it 'does not render the index page to a regular user' do
        get :index
        expect(response).not_to render_template('index')
        expect(response).not_to have_http_status(:ok)
      end
    end

    describe 'show' do
      it 'does not render the show page to a regular user' do
        get :show, params: { id: user.id }
        expect(response).not_to render_template('show')
      end
    end

    describe '#new' do
      it 'does not render new user page' do
        get :new
        expect(response).not_to render_template('new')
        expect(assigns(user: nil)).not_to be_a_new(User)
      end
    end

    describe '#create' do
      it 'noes create a new user' do
        expect do
          post :create,
               params: { user: { email: nil, password: nil, password_confirmation: nil } }
        end.to change(User, :count).by(0)
      end
    end

    describe '#edit' do
      it 'does not edit a user that\'s not an admin' do
        put :update, params: { id: User.first.id, user: attributes_for(:user, email: 'testemail@gmail.com') }
        expect(response).not_to be_successful
      end
    end

    describe '#destroy' do
      it 'deletes a user' do
        delete :destroy, params: { id: user.id }
        expect(response).not_to redirect_to admin_users_path
      end
    end
  end
end
