class ChecklistItemsController < ApplicationController
  before_action :require_login, :set_checklist
  before_action :set_checklist_item, only: %i[update destroy]

  def new
    @checklist_item = checklist_item_scope.new
  end

  def create
    @checklist_item = checklist_item_scope.build(checklist_item_params)
    @checklist_item.user = current_user
    @checklist_item.save
  end

  def update
    @checklist_item.update(checklist_item_params)
  end

  def destroy
    @checklist_item.destroy
  end

  private

  def set_checklist_item
    @checklist_item = checklist_item_scope.find(params[:id])
  end

  def set_checklist
    @checklist = current_user.checklists.find(params[:checklist_id])
  end

  def checklist_item_scope
    @checklist.checklist_items
  end

  def checklist_item_params
    params.key?(:checklist_item) ? params.require(:checklist_item).permit(:title, :checked) : { checked: '0' }
  end
end
