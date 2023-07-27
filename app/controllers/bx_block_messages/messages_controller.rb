# module BxBlockMessages
#     class MessagesController < ApplicationController
#         skip_before_action :verify_authenticity_token
       
#         def index
#             @messages = Message.all
#             render json: {'Messages': @messages}
#         end
    
#         def create
#             @message = Message.create!(message_params)
#             if @message.save
#                 render json: { 'Message': @message }
#             else
#                 render json: @message.errors
#             end
#         end
    
#         private
    
#         def message_params
#           params.permit(:user_id, :conversation_id, :content)
#         end
#     end
# end 


module BxBlockMessages
    class MessagesController < ApplicationController
        skip_before_action :verify_authenticity_token


      def create
      begin
        @conversation = Conversation.find(params[:conversation_id])
        @message = @conversation.messages.create!(message_params)
        # @message = @conversation.messages.create!(message_params.merge(user: current_user))
        render json: { "message" => @message} , status: :created
        rescue ActiveRecord::RecordNotFound
          render json: { error: " Conversation with ID #{params[:conversation_id]} not found." }, status: :not_found
        rescue ActiveRecord::RecordInvalid => e
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end
      private
      def message_params
        params.permit(:user_id, :conversation_id, :content)
      end
    end
  end
  
  
  
  