class Api::V1::TasksController < Api::V1::AuthController

  def index
    ActionCable.server.broadcast("online_#{current_user.id}", {
      message: 'wat'
    })
    @tasks = Task.joins(client: :company).where('companies.id = ?', current_user.company.id)
    # render jbuilder
  end

  def create
    @client = current_user.company.clients.find(params[:task][:client_id])
    @task = @client.tasks.new(task_params.merge!(status: 'open'))
    if @task.save
      # render jbuilder
    else
      render json: { error: 'Task not saved.' }, status: 422
    end
  end

  def update
    @client = current_user.company.clients.find(params[:task][:client][:id])
    @task = @client.tasks.find(params[:id])
    if @task.update(task_params)
      # render jbuilder
    else
      render json: { error: 'Task not updated' }, status: 422
    end
  end

  def destroy
    @task = Task.joins(client: {company: :users}).where('users.id = ?', current_user.id).find(params[:id])
    task_id = @task.id
    if @task.destroy
      render json: { task: task_id }, status: 200
    else
      render json: { error: 'Task deleted' }, status: 422
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :action, :body, :due_date, :status)
  end

end