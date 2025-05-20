module Todo::Operation
  class Index < Trailblazer::Operation
    step :model
    
    def model(ctx, params:, **)
      todos = Todo.all
      todos = todos.by_priority(params[:priority]) if params[:priority].present?
      todos = todos.by_category(params[:category_id]) if params[:category_id].present?
      todos = todos.by_date(params[:due_date]) if params[:due_date].present?
      
      if params[:sort].present?
        case params[:sort]
        when 'priority'
          todos = todos.order(:priority)
        when 'due_date'
          todos = todos.order(:due_date)
        when 'category'
          todos = todos.joins(:category).order('categories.name')
        end
      end
      
      ctx[:model] = todos
    end
  end
end
