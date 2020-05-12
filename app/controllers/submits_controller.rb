class SubmitsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @submits = Submit.all

    #ViewのFormで取得したパラメータをモデルに渡す
    @submits = Submit.search(params[:search])
  end

  def new
    @submit = Submit.new
    @submit.tags.build
  end

  def create
    require 'openssl'
    @submit = Submit.new(submit_params)
      #新しいSubmitの保存に成功した場合
    @submit.user_id = current_user.id
    if @submit.save
      if Image.create_images_by(image_params,@submit)

      #index.html.erbにページが移る
        redirect_to action: "index"
      else
        redirect_to action: "new"
      end
      #新しいSubmitの保存に失敗した場合
    else
      #もう一回投稿画面へ
    redirect_to action: "new"
    end
  end

  def show
    @submit = Submit.find(params[:id])
    @like = Like.new
  end

  private
   #セキュリティのため、許可した:name~というデータだけ取ってくるようにする
   def submit_params
    params.require(:submit).permit(:name,:address,:kind,:tag,:impression,:money,:latitude)
   end

   def image_params
     params.require(:submit).permit({image: []})

   end

end
