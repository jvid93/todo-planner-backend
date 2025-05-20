module Api
  class TodosController < BaseController
    def index
      result = Todo::Operation::Index.(params: params)
      render jsonapi: result[:model]
    end
    
    def show
      result = Todo::Operation::Show.(params: {id: params[:id]})
      render jsonapi: result[:model]
    end
    
    def create
      result = Todo::Operation::Create.(params: todo_params)
      render jsonapi: result[:model], status: :created
    end
    
    def update
      result = Todo::Operation::Update.(params: todo_params.merge(id: params[:id]))
      render jsonapi: result[:model]
    end
    
    def destroy
      Todo::Operation::Destroy.(params: {id: params[:id]})
      head :no_content
    end
    
    private
    
    def todo_params
      params.from_jsonapi.require(:todo).permit(:title, :description, :due_date, :priority, :completed, :category_id)
    end
  end
end
