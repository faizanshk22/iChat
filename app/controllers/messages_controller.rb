class MessagesController < ApplicationController
  before_action :authenticate_user!
  
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
