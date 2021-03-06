class BoardsController < ApplicationController
  before_action :require_login
  before_action :set_board, only: %i[show update destroy]

  def index
  end

  def show
  end

  def create
    @board = current_user.boards.new(title: t('boards.untitled'))
    if @board.save
      redirect_to @board
    else
      redirect_to boards_path, notice: @board.errors.full_messages.to_sentence
    end
  end

  def update
    if @board.update(board_params)
      render plain: 'success'
    else
      render plain: 'error'
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_url, notice: t('.notice')
  end

  private

  def set_board
    @board = current_user_boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end
end
