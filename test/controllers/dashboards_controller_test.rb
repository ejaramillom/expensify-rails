# frozen_string_literal: true

require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get ''
    assert_response :success
    assert_not_nil assigns( :today )
  end
end
