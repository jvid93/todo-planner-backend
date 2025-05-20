module Category::Operation
  class Index < Trailblazer::Operation
    step :model
    
    def model(ctx, **)
      ctx[:model] = Category.all
    end
  end
end
