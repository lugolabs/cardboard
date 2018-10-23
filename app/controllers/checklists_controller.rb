class ChecklistsController < ApplicationController
  before_action :require_login, :set_card
  before_action :set_checklist, only: %i[update destroy]

  def create
    @checklist = @card.checklists.create(user: current_user, title: t('checklists.default_title'))
    @checklist.checklist_items.build(user: current_user, title: '')
  end

  def update
    @checklist.update(checklist_params)
  end

  def destroy
    @checklist.destroy
  end

  private

  def set_checklist
    @checklist = @card.checklists.find(params[:id])
  end

  def set_card
    @card = current_user.cards.find(params[:card_id])
  end

  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
