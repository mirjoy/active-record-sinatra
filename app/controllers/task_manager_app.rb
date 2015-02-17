class TaskManager < Sinatra::Base
  get '/tasks' do
    @users = User.all
    erb :index
  end

  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    status_code, message = StatusGenerator.evaluate(task)
    status status_code
    body message
  end
end
