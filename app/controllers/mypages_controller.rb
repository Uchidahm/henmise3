class MypagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @total_likes = current_user.total_likes
    @user = current_user
  end

  def show
    @mypage = User.find(params[:id])
  end

  def new
  end

  def edit
    @user = current_user
    @avators = AvatorUser.where(user: current_user.id)
  end
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to action: "index"
  end
  private
  def user_params
    params.require(:user).permit(:avator_id)
  end
end
