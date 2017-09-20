class Api::V1::TasksController < Api::V1::AuthController
  before_action :set_client, only: [:create, :update]

  def index
    @tasks = Task.joins(client: :company).where('companies.id = ?', current_user.company.id)
    # render jbuilder
  end

  def create
    @task = @client.tasks.new(task_params).merge!(status: 'open')
    if @task.save
      # render jbuilder
    else
      render json: { error: 'Task not saved.' }, status: 422
    end
  end

  def update
    @task = @client.tasks.find(params[:id])
    if @task.update(task_params)
      # render jbuilder
    else
      render json: { error: 'Task not updated' }, status: 422
    end
  end

  private

  def set_client
    @client = current_user.company.clients.find(params[:task][:client][:id])
  end
  
  def task_params
    params.require(:task).permit(:name, :action, :body, :due_date, :status, :client_id)
  end

end