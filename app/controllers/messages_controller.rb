class MessagesController < ApplicationController
  before_action :set_card
  before_action :set_message, only: %i[edit update destroy]

  def new
    @message = Message.new
    respond_to do |format|
      format.html { render(plain: 'success') }
      format.js
    end
  end

  def create
    @message = @card.messages.build(message_params)
    @message.user = current_user
    @message.save
    respond_to do |format|
      format.html { render(plain: 'success') }
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html { render(plain: 'success') }
      format.js
    end
  end

  def update
    @message.update(message_params)
    respond_to do |format|
      format.html { render(plain: 'success') }
      format.js
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { render(plain: 'success') }
      format.js
    end
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
