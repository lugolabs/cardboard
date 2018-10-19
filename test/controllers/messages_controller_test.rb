require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card    = cards(:start)
    @message = messages(:one)
    @user    = users(:fred)
    sign_in_as @user
  end

  test 'should get new' do
    get new_card_message_url(@card)
    assert_response :success
  end

  test 'should create message' do
    assert_difference('Message.count') do
      post card_messages_url(@card), params: { message: { content: 'Hello' } }
    end

    assert_response :success
  end

  test 'should get edit' do
    get edit_card_message_url(@card, @message)
    assert_response :success
  end

  test 'should update message' do
    patch card_message_url(@card, @message), params: { message: { content: 'Hello there' } }
    assert_response :success
    assert_equal 'Hello there', @message.reload.content
  end

  test 'should destroy message' do
    assert_difference('Message.count', -1) do
      delete card_message_url(@card, @message)
    end
    assert_response :success
  end
end
