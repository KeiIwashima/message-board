class MessagesController < ApplicationController
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
    params.require(:message).permit(:name, :body)
  end  
  ##ここまで
end

