# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  context '#index ' do
    let(:user) { FactoryBot.create :user, email: 'newmail@gmail.com' }
    let(:campaign) { FactoryBot.create :campaign, name: 'second', message: 'second campaign created', user: user }

    before do
      @request.env['devise.mapping'] = Devise.mappings[user]
      sign_in user
      user.campaigns << campaign
    end

    it 'should render template' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(:ok)
    end

    it 'should render a campaign with an id' do
      get :show, params: { id: user.campaigns.first.id }
      expect(response).to render_template('show')
    end

    it 'should render create new campaign page' do
      get :new
      expect(response).to render_template('new')
    end

    it 'creates new campaign' do
      expect do
        post :create,
             params: { campaign: { name: campaign.name, message: campaign.message,
                                   user_id: user.id } }
      end.to change(user.campaigns, :count).by(1)
    end

    it 'edits a users campaign' do
      get :edit, params: { id: user.campaigns.first.id }
      expect(response).to be_successful
    end

    it 'updates a campaign' do
      put :update,
          params: { id: user.campaigns.first.id,
                    campaign: FactoryBot.attributes_for(:campaign, name: 'updated campaign') }
      expect(user.campaigns.first.name).to eq('updated campaign')
    end

    it 'deletes a campaign' do
      delete :destroy, params: { id: user.campaigns.first.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/')
    end
  end
end
