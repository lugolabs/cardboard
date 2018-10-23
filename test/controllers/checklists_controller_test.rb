require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card      = cards(:start)
    @checklist = checklists(:todo)
    @user      = users(:fred)
    sign_in_as @user
  end

  test 'should post create' do
    assert_difference('Checklist.count') do
      post card_checklists_url(@card), xhr: true
    end
    assert_response :success
    assert_equal I18n.t('checklists.default_title'), Checklist.order(created_at: :desc).first.title
  end

  test 'should patch update' do
    new_title = 'TODO'
    patch card_checklist_url(@card, @checklist), params: { checklist: { title: new_title } }, xhr: true

    assert_response :success
    assert_equal new_title, @checklist.reload.title
  end

  test 'should delete destroy' do
    assert_difference('Checklist.count', -1) do
      delete card_checklist_url(@card, @checklist), xhr: true
    end
    assert_response :success
  end
end
