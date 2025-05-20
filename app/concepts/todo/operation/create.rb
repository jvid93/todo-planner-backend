module Todo::Operation
  class Create < Trailblazer::Operation
    step Model(Todo, :new)
    step Contract::Build(constant: Todo::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
