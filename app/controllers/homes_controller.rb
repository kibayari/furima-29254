class HomesController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #バリデーションで問題があれば、保存はされず戻る
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      #保存されなければ、newに戻る
      render 'new'
    end
  end

  private

  def user_params
     params.require(:user).permit(:nickname, :email, :password)
  end
end
