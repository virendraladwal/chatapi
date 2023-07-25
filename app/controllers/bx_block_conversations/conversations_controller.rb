module BxBlockConversations
	class ConversationsController < ApplicationController
		# before_action :authenticate_user! # if followed step 2
		skip_before_action :verify_authenticity_token
		
		def index
			@users = User.all
			@conversations = Conversation.all
			render json: {'conversations': @conversations}
		end

		def create  
			if Conversation.between(params[:sender_id], params[:recipient_id]).present? 
				@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
			else
				@conversation = Conversation.create!(conversation_params)
			end
			render json: {"Conversation": @conversation }
		end


		private
		
		def conversation_params
		params.require(:conversation).permit(:sender_id, :recipient_id)
		end
    end 
end