require 'test_helper'

class BoardsTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:tracker)
    sign_in_as @board.user
  end

  test 'can manage boards' do
    get boards_url

    # Title
    assert_select 'h1', I18n.t('boards.index.title')
  end
end
