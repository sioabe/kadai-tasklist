class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show    
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  #StrongParameter
  def task_params
    params.require(:task).permit(:content)
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save #成功でtrue、失敗でfalse
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger]='タスクが投稿されませんでした'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success]="タスクは正常の更新されました"
      redirect_to @task
    else
      flash.now[:danger]="タスクは更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "Messageは正常に削除されました"
    redirect_to tasks_url
  end

end
