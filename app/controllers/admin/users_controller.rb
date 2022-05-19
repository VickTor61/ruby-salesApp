# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController # rubocop:todo Style/Documentation
    def index
      @users = User.all
      authorize @users
    end

    def show
      @user = User.find(params[:id])
      authorize @user
    end

    def new
      @user = User.new
      authorize @user
    end

    def create
      @user = User.new(user_params)
      authorize @user
      if @user.save
        flash[:success] = 'User created!' # rubocop:todo Rails/I18nLocaleTexts
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
      authorize @user
    end

    def update
      @user = User.find(params[:id])
      authorize @user

      if @user.update(user_params)
        flash[:success] = 'Successfully updated user' # rubocop:todo Rails/I18nLocaleTexts
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      authorize @user
      @user.destroy
      flash[:success] = 'User successfully deleted.' # rubocop:todo Rails/I18nLocaleTexts
      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
                                   role_ids: [])
    end
  end
end
