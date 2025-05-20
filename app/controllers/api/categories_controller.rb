module Api
  class CategoriesController < BaseController
    def index
      result = Category::Operation::Index.(params: params)
      render jsonapi: result[:model]
    end
    
    def show
      result = Category::Operation::Show.(params: {id: params[:id]})
      render jsonapi: result[:model]
    end
    
    def create
      result = Category::Operation::Create.(params: category_params)
      render jsonapi: result[:model], status: :created
    end
    
    def update
      result = Category::Operation::Update.(params: category_params.merge(id: params[:id]))
      render jsonapi: result[:model]
    end
    
    def destroy
      Category::Operation::Destroy.(params: {id: params[:id]})
      head :no_content
    end
    
    private
    
    def category_params
      params.from_jsonapi.require(:category).permit(:name)
    end
  end
end
