class MessagesController < ApplicationController
  def index
    @message = Message.new #メッセージモデルの新規インスタンスを作成
    @messages = Message.all #メッセージモデルの全てのインスタンスを取得
    #index.html.erbを表示
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end  
  ##ここまで
end
