class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:update,:destroy,:show,:edit]
  def index
    @task = current_user.tasks.build
    @tasks = current_user.tasks.order('created_at DESC').page(params[:page])#一覧表示用

  end

  def show    
    set_task
  end
  
  def new
    @task = Task.new
  end
  

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save #成功でtrue、失敗でfalse
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger]='タスクが投稿されませんでした'
      render :new
    end
  end
  
  def edit
    set_task
  end
  
  def update
    set_task
    if @task.update(task_params)
      flash[:success]="タスクは正常の更新されました"
      redirect_to @task
    else
      flash.now[:danger]="タスクは更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    set_task
    @task.destroy
    
    flash[:success] = "Messageは正常に削除されました"
    redirect_to tasks_url
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  #StrongParameter
  def task_params
    params.require(:task).permit(:content,:status,:user)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      flash[:danger] = '権限がありません'
      redirect_to root_url
    end
  end
end
