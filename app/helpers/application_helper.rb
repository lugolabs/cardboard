module ApplicationHelper
  def own_board?(board)
    board.user == current_user
  end

  def own_message?(message)
    message.user == current_user
  end

  def markdown_render(text)
    MarkdownHandler.render text
  end
end
