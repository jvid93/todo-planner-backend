module Category::Operation
  class Show < Trailblazer::Operation
    step Model(Category, :find_by)
    step :model!
    
    def model!(ctx, model:, **)
      ctx[:model] = model
    end
  end
end
