require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:todo)
    @card = cards(:start)
    @user = users(:fred)
    sign_in_as @user
  end

  test 'should get new' do
    get new_list_card_url(@list)
    assert_response :success
  end

  test 'should create card' do
    assert_difference('Card.count') do
      post list_cards_url(@list), params: { card: { description: 'New description', title: 'New title' } }
    end
    assert_response :success
  end

  test 'should show card' do
    get card_url(@card)
    assert_response :success
  end

  test 'should update card' do
    patch card_url(@card), params: { card: { description: 'New description', title: 'New title' } }
    assert_response :success
  end

  test 'should destroy card' do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to board_url(@list.board)
  end
end
