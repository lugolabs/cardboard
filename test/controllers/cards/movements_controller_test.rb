require 'test_helper'

class Cards::MovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:start)
    @list = lists(:doing)
    @user = users(:fred)
    sign_in_as @user
  end

  test 'should update list_id and position' do
    assert_equal lists(:todo), @card.list
    assert_equal 1, @card.row_order

    post card_movements_url(@card), params: { card: { list_id: @list.id, row_order_position: 0 } }

    assert_equal @list, @card.reload.list
    assert_equal 0, @card.row_order
  end
end
