class Todo < ApplicationRecord
  belongs_to :category, optional: true
  
  validates :title, presence: true
  validates :priority, inclusion: { in: %w(Low Medium High) }
  
  scope :by_priority, ->(priority) { where(priority: priority) if priority.present? }
  scope :by_category, ->(category_id) { where(category_id: category_id) if category_id.present? }
  scope :by_date, ->(date) { where(due_date: date) if date.present? }
  scope :completed, ->(status = true) { where(completed: status) }
end
