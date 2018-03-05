class CompletesController < ApplicationController
  before_action :authenticate_user!

  def index
    @completes = Complete.where(done: true)
  end
  def create
      @complete = Complete.new
      @complete.todo = Todo.find(params[:todo_id])
      @complete.update(done: true)
      @complete.user = current_user
      if @complete.save
        redirect_to root_path, notice: 'Se ha agregado orden con exito'
      else
        redirect_to root_path, alert: 'No se ha agregado orden con exito'
      end
  end
  def destroy
    @complete = Complete.find(params[:id])
    if @complete.done==true
      if @complete.destroy?
        redirect_to root_path, notice: 'ya no esta completada'
      else
        redirect_to orders_path, notice: 'no se pudo actualizar'
      end
    end
  end
end
