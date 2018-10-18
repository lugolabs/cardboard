module Cards
  class MovementsController < ApplicationController
    before_action :set_card

    def create
      @card.update card_params
      head :no_content
    end

    private

    def set_card
      @card = current_user.cards.find(params[:card_id])
    end

    def card_params
      params.require(:card).permit(:list_id, :row_order_position)
    end
  end
end
