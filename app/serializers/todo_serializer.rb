class TodoSerializer
  include JSONAPI::Serializer
  
  attributes :title, :description, :due_date, :priority, :completed, :created_at, :updated_at
  
  belongs_to :category, if: Proc.new { |todo| todo.category.present? }
end
