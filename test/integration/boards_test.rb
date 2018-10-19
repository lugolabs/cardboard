require 'test_helper'

class BoardsTest < ActionDispatch::IntegrationTest
  # setup do
  #   @board = boards(:one)
  # end

  test 'can manage boards' do
    get boards_url

    assert_select 'h1', I18n.t('boards.index.title')
  end
end
