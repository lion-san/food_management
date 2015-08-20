# encoding: utf-8
class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new

    @user = User.new
  end


  def create
    @user = User.new(user_params)
    util = UserUtil.new
    #初期ポイント
    util.point = 50000
    @user.user_util = util
    if @user.save
      sign_in @user
      flash[:success] = "ようこそ!"
      redirect_to items_path
    else
      render 'new'
    end
  end


  def reset
  end

  def resetpass
    user = User.find_by(email: params[:user][:email])
    if user
      if user.user_util.update_attribute(:reset, 2)
        flash[:success] = "リセットを受け付けました。暫くお待ちください。"
        redirect_to signin_path
      else
        render 'reset'
      end
    else
      render 'reset'
    end
  end


  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to items_path
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before actions

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
