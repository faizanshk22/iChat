class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @current_user = current_user
    @message = @current_user.messages.new(content: msg_params[:content], chatroom_id: params[:chatroom_id], attachments: msg_params[:attachments])
    @message.save
  end

  private

  def msg_params
    params.require(:message).permit(:content, attachments: [])
  end
end
