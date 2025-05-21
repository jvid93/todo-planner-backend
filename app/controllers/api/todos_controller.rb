module Api
  class TodosController < BaseController
    deserializable_resource :todo, only: %i[create update]

    def index
      result = Todo::Operation::Index.(params: params)
      render json: TodoSerializer.new(result[:model]).serializable_hash
    end

    def show
      result = Todo::Operation::Show.(params: { id: params[:id] })
      render json: TodoSerializer.new(result[:model]).serializable_hash
    end

    def create
      result = Todo::Operation::Create.(params: todo_params)

      if result.success?
        render json: TodoSerializer.new(result[:model]).serializable_hash,
               status: :created
      else
        render json: { errors: result['contract.default'].errors.to_h },
               status: :unprocessable_entity
      end
    end

    def update
      result = Todo::Operation::Update.(params: todo_params.merge(id: params[:id]))

      if result.success?
        render json: TodoSerializer.new(result[:model]).serializable_hash
      else
        render json: { errors: result['contract.default'].errors.to_h },
               status: :unprocessable_entity
      end
    end

    def destroy
      result = Todo::Operation::Destroy.(params: { id: params[:id] })

      if result.success?
        head :no_content
      else
        render json: { errors: result['result.model'].errors.to_h },
               status: :unprocessable_entity
      end
    end

    private

    def todo_params
      params.require(:todo).permit(
        :title, :description, :due_date, :priority, :completed, :category_id
      )
    end
  end
end
