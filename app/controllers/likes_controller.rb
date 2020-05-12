class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @submit = Submit.find(params[:submit_id])
    @like = Like.new(like_params)

    if @like.save
    #いいねした相手のいいね総数を調べてそれに応じてその人のアバターを増やす。
      @user_liked = User.find(Submit.find(@like.submit_id).user_id)
      @user_liked.create_avator
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = Like.find_by(submit_id: params[:submit_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def like_params
    params.require(:like).permit(:submit_id, :user_id)
  end
end
