class CardsController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_card, only: %i[show update destroy]

  def show
    @board = @list.board
    render 'boards/show'
  end

  def new
    @card = Card.new
    respond_to do |format|
      format.html { render(plain: 'success') }
      format.js
    end
  end

  def create
    @card = @list.cards.build(card_params.merge(row_order_position: :first))
    @card.user = current_user
    @card.save
  end

  def update
    if @card.update(card_params)
      render plain: 'success'
    else
      render plain: 'error'
    end
  end

  def destroy
    @card.destroy
    redirect_to @list.board, notice: t('.success')
  end

  private

  def set_list
    @list = current_user.all_lists.find(params[:list_id])
  end

  def set_card
    @card = current_user.cards.find(params[:id])
    @list = @card.list
  end

  def card_params
    params.require(:card).permit(:title, :description)
  end
end
