require 'test_helper'

class Cards::DescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:start)
    sign_in_as @card.user
  end

  test 'should get edit' do
    get edit_card_description_url(@card), xhr: true
    assert_response :success
  end

  test 'should update description' do
    new_description = 'New description'
    assert_not_equal new_description, @card.description

    patch card_description_url(@card), params: { card: { description: new_description } }, xhr: true

    assert_equal new_description, @card.reload.description
  end
end
