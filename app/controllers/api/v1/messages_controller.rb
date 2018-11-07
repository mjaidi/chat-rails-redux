class Api::V1::MessagesController < ApplicationController
  before_action :find_channel

  def index
    messages = Message.where(channel_id: @channel.id)
    @messages_formated = []
    messages.each do |message|
      @messages_formated << {id: message.id, author: message.user.email, content: message.content, created_at: message.created_at}
    end
    render json: @messages_formated
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.channel = @channel
    @message.save

    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_channel
    @channel = Channel.find_by_name(params[:channel_id])
  end
end
