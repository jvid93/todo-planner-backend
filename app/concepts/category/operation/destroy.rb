module Category::Operation
  class Destroy < Trailblazer::Operation
    step Model(Category, :find_by)
    step :delete!
    
    def delete!(ctx, model:, **)
      model.destroy
    end
  end
end
