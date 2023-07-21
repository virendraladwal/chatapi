module BxBlockMessages
    class MessagesController < ApplicationController
        skip_before_action :verify_authenticity_token
       
        def index
            @messages = Message.all
            render json: {'Messages': @messages}
        end
    
        def create
            @message = Message.create!(message_params)
            if @message.save
                render json: { 'Message': @message }
            else
                render json: @message.errors
            end
        end
    
        private
    
        def message_params
            # debugger
        params.permit(:user_id, :conversation_id, :content)
        end
    end
end 
