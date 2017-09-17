class Api::V1::TasksController < Api::V1::AuthController
  before_action :set_company, only: [:create]

  def index
    @tasks = current_user.company.tasks
    # render jbuilder
  end

  def create
    @task = @company.tasks.new(task_params)
    if @task.save
      # render jbuilder
    else
      render json: { error: 'Task not saved.' }, status: 422
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:label)
  end

end