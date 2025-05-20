module Category::Operation
  class Create < Trailblazer::Operation
    step Model(Category, :new)
    step Contract::Build(constant: Category::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
