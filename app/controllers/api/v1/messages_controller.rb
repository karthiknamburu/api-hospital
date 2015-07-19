class API::V1::MessagesController < ApplicationController
  before_action :set_chat, only: [:index, :create]
  before_action :set_message, only: [:destroy]

  # GET /messages.json
  def index
    @messages = @chat.messages
    render json: @messages
  end

  # POST /messages.json
  def create
    @message = @chat.messages.new(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1.json
  def destroy
    @message.destroy
    head :no_content
  end

  private
    def set_chat
      @chat = Chat.find(params[:chat_id])
    end

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      JSON.parse(request.body.read)["message"]
    end
end
