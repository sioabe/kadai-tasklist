class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]='ユーザーを登録しました'
      redirect_to root_path #ユーザー登録成功時のジャンプ先は要検討
    else
      flash.now[:danger]='ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
