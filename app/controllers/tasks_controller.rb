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

  def edit # 編集画面を表示するeditアクション
    @task = Task.find(params[:id]) # URL内に含まれるタスクのidをパラメータから受け取ってデータベースを検索
  end

  def update # 画面から送られてきたデータを使ってデータベースを更新するupdateアクション
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク 「#{task.name}」を更新しました。"
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
