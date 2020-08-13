require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative 'todo_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_that_to_a_returns_todos_array
    assert_equal(@todos, @list.to_a)
  end

  def test_size_returns_todos_array_size
    assert_equal(3, @list.size)
  end

  def test_first_returns_todos_first_element
    assert_equal(@todo1, @list.first)
  end

  def test_last_returns_todos_last_element
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    removed = @list.shift
    assert_equal(@todo1, removed)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    removed = @list.pop
    assert_equal(@todo3, removed)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question_mark
    refute(@list.done?)
    @todo1.done! && (@todo2.done! && @todo3.done!)
    assert(@list.done?)
  end

  def test_an_object_that_is_not_todo_raises_a_type_error
    assert_raises(TypeError) { @list << @todos }
    assert_raises(TypeError) { @list << 1 }
    assert_raises(TypeError) { @list << "Hello" }
  end

  def test_shovel_method
    todo = Todo.new("test task")
    @list << todo
    assert_equal([@todo1, @todo2, @todo3, todo], @list.to_a)
  end

  def test_that_add_and_shovel_method_are_same
    todo = Todo.new("code all day")
    @todos << todo
    @list.add(todo)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(19) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(20) }
    @list.mark_done_at(0)
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, false)
    assert_equal(@todo3.done?, false)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(20) }
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    @list.mark_undone_at(0)
    assert_equal(@todo1.done?, false)
    assert_equal(@todo2.done?, true)
    assert_equal(@todo3.done?, false)
  end

  def test_done_bang
    @list.done!
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, true)
    assert_equal(@todo3.done?, true)
    assert_equal(@list.done?, true)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(20) }
    removed = @list.remove_at(1)
    assert_equal(@todo2, removed)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym

    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_todo_done
    @list.first.done!
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym

    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_iteration_with_each
    counter = 0
    @list.each { |todo| counter += 1 }
    assert_equal(counter, 3)
  end

  def test_each_returns_original
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
end
