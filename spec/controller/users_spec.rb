# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:user_admin) { FactoryBot.create :user_role }
  let(:user) { FactoryBot.create(:user) }

  context 'admin ' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[user_admin.user]
      sign_in user_admin.user
    end

    context '#index' do
      it ' should render the index page to admin user' do
        get :index
        expect(response).to render_template('index')
        expect(response).to have_http_status(:ok)
      end
    end

    context '#show' do
      it 'should render the show page to admin user' do
        get :show, params: { id: user_admin.user.id }
        expect(response).to render_template('show')
      end
    end

    context '#new' do
      it 'should render new user page' do
        get :new
        expect(response).to render_template('new')
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    context '#create' do
      it 'should create a new user' do
        expect do
          post :create,
               params: { user: { email: 'newemail@gmail.com', password: 'username',
                                 password_confirmation: 'username' } }
        end.to change(User, :count).by(1)
      end

      it 'should redirect to the new user path' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context '#edit' do
      it 'should ' do
        put :update, params: { id: User.first.id, user: FactoryBot.attributes_for(:user, email: 'testemail@gmail.com') }
        expect(User.first.email).to eq('testemail@gmail.com')
      end
    end

    context '#destroy' do
      it 'should delete a user' do
        delete :destroy, params: { id: user.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to admin_users_path
      end
    end
  end

  context 'regular user' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[user]
      sign_in user
    end

    context '#index' do
      it ' should not render the index page to a regular user' do
        get :index
        expect(response).to_not render_template('index')
        expect(response).to_not have_http_status(:ok)
      end
    end

    context 'show' do
      it 'should not render the show page to a regular user' do
        get :show, params: { id: user.id }
        expect(response).to_not render_template('show')
      end
    end

    context '#new' do
      it 'should not render new user page' do
        get :new
        expect(response).to_not render_template('new')
        expect(assigns(user: nil)).to_not be_a_new(User)
      end
    end

    context '#create' do
      it 'should no create a new user' do
        expect do
          post :create,
               params: { user: { email: nil, password: nil, password_confirmation: nil } }
        end.to change(User, :count).by(0)
      end
    end

    context '#edit' do
      it 'should not edit a user that\'s not an admin' do
        put :update, params: { id: User.first.id, user: FactoryBot.attributes_for(:user, email: 'testemail@gmail.com') }
        expect(response).to_not be_successful
      end
    end

    context '#destroy' do
      it 'should delete a user' do
        delete :destroy, params: { id: user.id }
        expect(response).to_not redirect_to admin_users_path
      end
    end

    # end
  end
end
