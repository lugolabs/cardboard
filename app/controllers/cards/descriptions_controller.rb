module Cards
  class DescriptionsController < ApplicationController
    before_action :set_card

    def edit
      respond_to do |format|
        format.html { render(plain: 'success') }
        format.js
      end
    end

    def update
      @card.update card_params
      respond_to do |format|
        format.html { render(plain: 'success') }
        format.js
      end
    end

    private

    def set_card
      @card = current_user.cards.find(params[:card_id])
    end

    def card_params
      params.require(:card).permit(:description)
    end
  end
end
