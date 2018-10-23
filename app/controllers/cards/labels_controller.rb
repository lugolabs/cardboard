module Cards
  class LabelsController < ApplicationController
    before_action :require_login

    def update
      @card = current_user.cards.find(params[:card_id])
      @card.update(card_params)
    end

    private

    def card_params
      params.require(:card).permit(:color)
    end
  end
end
