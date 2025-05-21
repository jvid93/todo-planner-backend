module Api
  class CategoriesController < BaseController
    deserializable_resource :category, only: %i[create update]

    def index
      result = Category::Operation::Index.(params: params)
      render json: CategorySerializer.new(result[:model]).serializable_hash
    end

    def show
      result = Category::Operation::Show.(params: { id: params[:id] })
      render json: CategorySerializer.new(result[:model]).serializable_hash
    end

    def create
      result = Category::Operation::Create.(params: category_params)

      if result.success?
        render json: CategorySerializer.new(result[:model]).serializable_hash,
               status: :created
      else
        render json: { errors: result['contract.default'].errors.to_h },
               status: :unprocessable_entity
      end
    end

    def update
      result = Category::Operation::Update.(params: category_params.merge(id: params[:id]))

      if result.success?
        render json: CategorySerializer.new(result[:model]).serializable_hash
      else
        render json: { errors: result['contract.default'].errors.to_h },
               status: :unprocessable_entity
      end
    end

    def destroy
      result = Category::Operation::Destroy.(params: { id: params[:id] })

      if result.success?
        head :no_content
      else
        render json: { errors: result['result.model'].errors.to_h },
               status: :unprocessable_entity
      end
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
