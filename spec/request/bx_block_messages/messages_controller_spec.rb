require 'rails_helper'

RSpec.describe BxBlockMessages::MessagesController, type: :controller do
  describe "POST #create" do
    let(:conversation) { FactoryBot.create(:conversation) }
    context "with valid attributes" do
      let(:valid_attributes) do
        {
          user_id: 1,
          conversation_id: conversation.id,
          content: "Hello, this is a test message."
        }
      end

      it "creates a new message" do
        expect {
          post :create, params: valid_attributes
        }.to change(Message, :count).by(1)
      end

      it "returns a 201 status code" do
        post :create, params: valid_attributes
        expect(response).to have_http_status(201)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) do
        {
          user_id: 1,
          content: nil
        }
      end

      it "does not create a new message" do
        expect {
          post :create, params: invalid_attributes
        }.to_not change(Message, :count)
      end

      it "returns an error with status code 404" do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(404)
      end
    end

    context "with non-existent conversation_id" do
      let(:invalid_conversation_attributes) do
        {
          user_id: 1, 
          conversation_id: 999, 
          content: "Hello, this is a test message."
        }
      end

      it "returns an error with status code 404" do
        post :create, params: invalid_conversation_attributes
        expect(response).to have_http_status(404)
      end
    end
  end
end