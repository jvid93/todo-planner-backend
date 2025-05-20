module Todo::Operation
  class Destroy < Trailblazer::Operation
    step Model(Todo, :find_by)
    step :delete!
    
    def delete!(ctx, model:, **)
      model.destroy
    end
  end
end
