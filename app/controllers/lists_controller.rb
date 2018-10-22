class ListsController < ApplicationController
  before_action :require_login, :set_board
  before_action :set_list, only: %i[update destroy]

  def create
    @list = @board.lists.create!(title: t('lists.untitled'), user: current_user)
  end

  def update
    if @list.update(list_params)
      render plain: 'success'
    else
      render plain: 'error'
    end
  end

  def destroy
    @list.destroy
    redirect_to @board
  end

  private

  def set_board
    @board = current_user_boards.find(params[:board_id])
  end

  def set_list
    @list = @board.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
