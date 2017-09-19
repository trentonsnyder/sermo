class Api::V1::TasksController < Api::V1::AuthController
  before_action :set_company, only: [:create]

  def index
    @tasks = Task.joins(client: :company).where('companies.id = ?', current_user.company.id)
    # render jbuilder
  end

  def create
    @task = @company.tasks.new(task_params).merge!(status: 'open')
    if @task.save
      # render jbuilder
    else
      render json: { error: 'Task not saved.' }, status: 422
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :action, :body, :due_date, :status, :client_id)
  end

end