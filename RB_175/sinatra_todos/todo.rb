require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

helpers do
  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0
  end

  def list_class(list)
    "complete" if list_complete?(list)
  end

  def todos_count(list)
    list[:todos].size
  end

  def todos_remaining_count(list)
    list[:todos].select { |todo| !todo[:completed] }.size
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }
    incomplete_lists.each { |list| yield list, lists.index(list) }
    complete_lists.each { |list| yield list, lists.index(list) }
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }
    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# View list of lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << {name: list_name, todos: []}
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# Add todos to an existing list
post "/lists/:id/todos" do
  todo_name = params[:todo_name].strip
  index = params[:id].to_i
  @list = load_list(index)
  @list[:todos] << {name: todo_name}
  redirect "/lists/#{index}"
end

# Update an existing list
post "/lists/:id" do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  index = params[:id].to_i
  @list = load_list(index)
  if error && @list[:name] != list_name
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{index}"
  end
end

# Delete a list
post "/lists/:id/destroy" do
  index = params[:id].to_i
  @list = session[:lists][index]
  session[:lists].delete(@list)
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    @name = params[:name]
    session[:success] = "'#{@list[:name]}' was deleted."
    redirect "/lists"
  end
end

# Delete a todo in a list
post "/lists/:id/todos/:todo_id/destroy" do
  index = params[:id].to_i
  @list = load_list(index)
  todo_index = params[:todo_id].to_i
  @list[:todos].delete_at(todo_index)
  session[:success] = "The todo was deleted."
  redirect "/lists/#{index}"
end

# Update status of a todo
post "/lists/:id/todos/:todo_id" do
  index = params[:id].to_i
  @list = load_list(index)
  todo_index = params[:todo_id].to_i
  is_completed = params[:completed] == "true"
  @list[:todos][todo_index][:completed] = is_completed
  session[:success] = "The todo has been updated."
  redirect "/lists/#{index}"
end

# Update all todos in a list
post "/lists/:id/complete_all" do
  index = params[:id].to_i
  @list = load_list(index)
  @list[:todos].each { |todo| todo[:completed] = true}
  session[:success] = "The todos in this list have been updated."
  redirect "/lists/#{index}"
end

# See individual list
get "/lists/:id" do
  index = params[:id].to_i
  @list = load_list(index)
  erb :list, layout: :layout
end

# Edit an existing list
get "/lists/:id/edit" do
  index = params[:id].to_i
  @list = session[:lists][index]
  erb :edit_list, layout: :layout
end

# Return an error message if the name is invalid. 
# Return nil if name is valid.
def error_for_list_name(name)
  if session[:lists].any? { |list| list[:name] == name }
    "List name must be unique."
  elsif !(1..100).cover? name.size
    "List name must be between 1 and 100 characters."
  end
end

def load_list(index)
  list = session[:lists][index] if index && session[:lists][index]
  return list if list
  session[:error] = "The specified list was not found"
  redirect "/lists"
end
