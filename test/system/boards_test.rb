# frozen_string_literal: true

require 'application_system_test_case'

class BoardsTest < ApplicationSystemTestCase
  setup do
    @board = boards(:tracker)
  end

  test 'can manage boards' do
    visit boards_url(as: users(:fred))

    # Title
    assert_selector 'h1', text: I18n.t('boards.index.title')

    # Board page
    click_link @board.title
    assert_selector 'h1', text: @board.title
  end
end
