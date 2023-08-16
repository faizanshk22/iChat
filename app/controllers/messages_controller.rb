class MessagesController < ApplicationController
  before_action :authenticate_user!
  def new
    @current_user = current_user
    @message = @current_user.messages.new
  end

  def create
    @current_user = current_user
    @message = @current_user.messages.new(content: msg_params[:content], chatroom_id: params[:chatroom_id])
    @message.save
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
#   def index
#     @conversation = Conversation.find(params[:conversation_id])
#     @messages = @conversation.messages.order(created_at: :asc)
#   end
#   def create
#     @message = @conversation.messages.new(message_params)
#     @message.user = current_user

#     if @message.save
#       ActionCable.server.broadcast(
#         "chat_#{params[:conversation_id]}",
#         message: render_message(@message)
#       )
#       #redirect routes to be define
#     else
#       # render
#     end
#   end
#   private

#   def render_message(message)
#     ApplicationController.render(
#       partial: "messages/message",
#       locals: { message: message }
#     )
#   end
end
