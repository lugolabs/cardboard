require 'test_helper'

class Cards::LabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:start)
    sign_in_as @card.user
  end

  test 'should update label color' do
    color = Card::COLORS.first
    assert_not_equal color, @card.color

    patch card_labels_url(@card), params: { card: { color: color } }, xhr: true

    assert_response :success
    assert_equal color, @card.reload.color
  end
end
