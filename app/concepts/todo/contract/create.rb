module Todo::Contract
  class Create < Reform::Form
    property :title
    property :description
    property :due_date
    property :priority
    property :completed
    property :category_id
    
    validates :title, presence: true
    validates :priority, inclusion: { in: %w(Low Medium High) }
  end
end
