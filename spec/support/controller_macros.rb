module ControllerMacros
  def login_admin
    before(:each) do
        @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin)
      end
    end

  def login_user(user)
    before(:each) do

    end
  end
end