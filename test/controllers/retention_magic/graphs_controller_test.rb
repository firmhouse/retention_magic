require 'test_helper'

module RetentionMagic
  class GraphsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "index" do
      RetentionMagic.user_class = "User"
      RetentionMagic.activation_counter_columns = [ :posts_count ]
      RetentionMagic.retention_models = %w()

      User.create!(name: "John", created_at: Date.civil(2015, 10, 1), posts_count: 10)

      get :index

      assert_response :success
      assert_equal "Oct 2015", assigns(:first_cohort)
      assert_equal User, assigns(:user_class)
    end
  end
end
