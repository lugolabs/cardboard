require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:tracker)
    @user = users(:fred)
    sign_in_as @user
  end

  test 'should get index' do
    get boards_url
    assert_response :success
  end

  test 'should create board' do
    assert_difference('Board.count') do
      post boards_url
    end

    assert_redirected_to board_url(Board.last)
  end

  test 'should not create board if title is the same' do
    @user.boards.create(title: I18n.t('boards.untitled'))
    assert_difference('Board.count', 0) do
      post boards_url
    end

    assert_redirected_to boards_url
    assert_equal 'Title has already been taken', flash[:notice]
  end

  test 'should show board' do
    get board_url(@board)
    assert_response :success
  end

  test 'should update board' do
    patch board_url(@board), params: { board: { title: 'New title' } }
    assert_response :success
  end

  test 'should destroy board' do
    assert_difference('Board.count', -1) do
      delete board_url(@board)
    end

    assert_redirected_to boards_url
  end
end
