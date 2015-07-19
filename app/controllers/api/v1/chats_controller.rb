class API::V1::ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_ids].present?
      user_ids = params[:user_ids].split(',')
      @chats = Chat.where('user_one_id IN (?) OR user_two_id IN (?)', user_ids, user_ids).includes(:messages)
    else
      @chats = Chat.all.includes(:messages)
    end
    render json: @chats.to_json(include: [:user_one, :user_two, :messages])
  end

  # POST /chats.json
  def create
    @chat = Chat.find_or_create_by_user_one_id_and_user_two_id(chat_params["user_one_id"], chat_params["user_two_id"])
    render json: @chat.to_json(include: [:user_one, :user_two, :messages])
  end

  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      request.body.rewind
      JSON.parse(request.body.read)["chat"]
    end
end
