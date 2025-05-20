module Todo::Operation
  class Update < Trailblazer::Operation
    step Model(Todo, :find_by)
    step Contract::Build(constant: Todo::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
