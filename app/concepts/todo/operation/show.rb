module Todo::Operation
  class Show < Trailblazer::Operation
    step Model(Todo, :find_by)
    step :model!
    
    def model!(ctx, model:, **)
      ctx[:model] = model
    end
  end
end
