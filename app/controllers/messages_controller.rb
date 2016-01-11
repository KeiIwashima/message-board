class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def destroy
    @message.destroy
    redirect_to root_path , notice: 'メッセージを削除しました'
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      #保存に失敗した場合はedit画面に戻す
    render 'edit'
    end
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  def index
    @message = Message.new #メッセージモデルの新規インスタンスを作成
    @messages = Message.all #メッセージモデルの全てのインスタンスを取得
    #index.html.erbを表示
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      #メッセージを保存できなかった場合
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end  
  ##ここまで
end

