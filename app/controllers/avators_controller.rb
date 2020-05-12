class AvatorsController < ApplicationController
  # def new
  #   @avator = Avator.new
  # end
  # def create
  #  @avator = Avator.new(avator_params)
  #
  #  #新しいTweetの保存に成功した場合
  #  if @avator.save
  #    #index.html.erbにページが移る
  #    redirect_to action: "new"
  #  #新しいTweetの保存に失敗した場合
  #  else
  #    #もう一回投稿画面へ
  #    redirect_to action: "new"
  #  end
  # end
  #
  # private
  # #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  # def avator_params
  #  params.require(:avator).permit(:name,:image)
  # end
end
