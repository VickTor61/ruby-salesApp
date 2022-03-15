# require 'rails_helper'
#
# RSpec.describe SalesController, type: :controller do
#   let(:user) { FactoryBot.create(:user, email: 'newuser@gmail.com') }
#
#   before do
#     allow(controller).to receive(:authenticate_user!).and_return(true)
#     allow(controller).to receive(:current_user).and_return(user)
#   end
#   describe 'GET /index' do
#     it 'displays the user\'s email after authenticating' do
#       get '#index'
#       post '/users/sign_in', user: user
#
#       expect(response.status).to eql 200
#       expect(response).to redirect_to('/campaign')
#       expect(response).to render_template(:index)
#       expect(response.body).to include 'Hello'
#       follow_redirect!
#     end
#   end
# end
