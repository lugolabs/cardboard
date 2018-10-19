class MessagesController < ApplicationController
  before_action :set_card
  before_action :set_message, only: %i[edit update destroy]

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = @card.messages.build(message_params)
    @message.user = current_user
    @message.save
  end

  def update
    @message.update(message_params)
  end

  def destroy
    @message.destroy
  end

  private

  def set_card
    @card = current_user.cards.find(params[:card_id])
  end

  def set_message
    @message = @card.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
