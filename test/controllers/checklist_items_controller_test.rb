require 'test_helper'

class ChecklistItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checklist      = checklists(:todo)
    @checklist_item = checklist_items(:todo_one)
    @user           = users(:fred)
    sign_in_as @user
  end

  test 'should get new' do
    get new_checklist_checklist_item_url(@checklist), xhr: true
    assert_response :success
  end

  test 'should post create' do
    title = 'Update checklists'
    assert_difference 'ChecklistItem.count' do
      post checklist_checklist_items_url(@checklist), params: { checklist_item: { title: title } }, xhr: true
    end

    assert_response :success
    assert_equal title, @checklist.checklist_items.order(created_at: :desc).first.title
  end

  test 'should patch update' do
    title = 'Update all checklist'
    patch checklist_checklist_item_url(@checklist, @checklist_item), params: { checklist_item: { title: title } }, xhr: true

    assert_response :success
    assert_equal title, @checklist_item.reload.title
  end

  test 'should delete destroy' do
    assert_difference 'ChecklistItem.count', -1 do
      delete checklist_checklist_item_url(@checklist, @checklist_item), xhr: true
    end
    assert_response :success
  end
end
