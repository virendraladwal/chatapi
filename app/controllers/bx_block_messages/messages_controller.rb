module BxBlockConversations
    class MessagesController < ApplicationController
        skip_before_action :verify_authenticity_token
       
        def index
        @messages = Message.all
        render json: {'Messages': @Messages}
        end
    
        def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to messages_path, notice: 'Message sent successfully.'
        else
            redirect_to messages_path, alert: 'Failed to send message.'
        end
        end
    
        private
    
        def message_params
        params.require(:message).permit(:user_id, :conversation_id, :content)
        end
    end
end 