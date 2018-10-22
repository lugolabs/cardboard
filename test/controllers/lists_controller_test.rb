require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:tracker)
    @list  = lists(:todo)
    @user  = users(:fred)
    sign_in_as @user
  end

  test 'should create list' do
    assert_difference('List.count') do
      post board_lists_url(@board), xhr: true
    end

    assert_response :success
    assert List.find_by(title: I18n.t('lists.untitled'))
  end

  test 'should update list' do
    patch board_list_url(@board, @list), params: { list: { title: 'New title' } }
    assert_response :success
    assert_equal 'New title', @list.reload.title
  end

  test 'should destroy list' do
    assert_difference('List.count', -1) do
      delete board_list_url(@board, @list)
    end

    assert_redirected_to board_url(@board)
  end
end
