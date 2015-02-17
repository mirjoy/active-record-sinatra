class TaskManager < Sinatra::Base
  get '/tasks' do
    @users = User.all
    erb :index
  end
end
