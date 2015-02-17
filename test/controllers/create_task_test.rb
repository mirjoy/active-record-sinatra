require './test/test_helper'

class CreateTaskTest < Minitest::Test 
  include Rack::Test::Methods

  def app
    TaskManager
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_can_create_task_with_title_and_description
    post '/tasks', { task: { title: "something", description: "else"} }
    assert_equal 1, Task.count
    assert_equal 200, last_response.status
  end

  def test_cannot_create_task_with_missing_title
    post '/tasks', { task: { description: "else"} }
    assert_equal 0, Task.count
    assert_equal 404, last_response.status
  end

  def test_cannot_create_task_with_duplicate_title
    post '/tasks', { task: { title: "something", description: "else"} }
    post '/tasks', { task: { title: "something", description: "else1"} }
    assert_equal 1, Task.count
    assert_equal 302, last_response.status
  end
end
