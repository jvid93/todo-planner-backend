module Category::Operation
  class Update < Trailblazer::Operation
    step Model(Category, :find_by)
    step Contract::Build(constant: Category::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
